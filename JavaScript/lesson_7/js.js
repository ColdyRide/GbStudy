"use strict";
const settings = {
    rowsCount: 21,
    colsCount: 21,
    speed: 2,
    winFoodCount: 50,
    barriersCount: 1
};

const config = {
    settings,
    init(userSettings = {}) {
        Object.assign(this.settings, userSettings);
    },

    getRowsCount() {
        return this.settings.rowsCount;
    },

    getColsCount() {
        return this.settings.colsCount;
    },

    getSpeed() {
        return this.settings.speed;
    },

    getWinFoodCount() {
        return this.settings.winFoodCount;
    },

    getBarriersCount() {
        return this.settings.barriersCount;
    },

    validate() {
        const result = {
            isValid: true,
            errors: [],
        };

        if (this.getRowsCount() < 10 || this.getRowsCount() > 30) {
            result.isValid = false;
            result.errors.push('Неверные настройки, значение rowsCount должно быть в диапазоне [10, 30].');
        }

        if (this.getRowsCount() < 10 || this.getRowsCount() > 30) {
            result.isValid = false;
            result.errors.push('Неверные настройки, значение colsCount должно быть в диапазоне [10, 30].');
        }

        if (this.getSpeed() < 1 || this.getSpeed() > 10) {
            result.isValid = false;
            result.errors.push('Неверные настройки, значение speed должно быть в диапазоне [1, 10].');
        }

        if (this.getWinFoodCount() < 5 || this.getWinFoodCount() > 50) {
            result.isValid = false;
            result.errors.push('Неверные настройки, значение winFoodCount должно быть в диапазоне [5, 50].');
        }

        if (this.getBarriersCount() < 1 || this.getBarriersCount() > 5) {
            result.isValid = false;
            result.errors.push('Неверные настройки, значение barriersCount должно быть в диапазоне [1, 5].');
        }

        return result;
    },
};

const map = {
    cells: null, // {x1_y1: td, x1_y2: td}
    usedCells: null,

    init(rowsCount, colsCount) {
        const table = document.getElementById('game');
        table.innerHTML = '';

        this.cells = {}; // {x1_y1: td, x1_y2: td}
        this.usedCells = [];

        for (let row = 0; row < rowsCount; row++) {
            const tr = document.createElement('tr');
            tr.classList.add('row');
            table.appendChild(tr);

            for (let col = 0; col < colsCount; col++) {
                const td = document.createElement('td');
                td.classList.add('cell');

                this.cells[`x${col}_y${row}`] = td;
                tr.appendChild(td);
            }
        }
    },

    render(snakePointsArray, foodPoint, barrierPointsArray) {
        for (const cell of this.usedCells) {
            cell.className = 'cell';
        }

        this.usedCells = [];
        snakePointsArray.forEach((point, index) => {
            const snakeCell = this.cells[`x${point.x}_y${point.y}`];
            if (snakeCell) {
                snakeCell.classList.add(index === 0 ? 'snakeHead' : 'snakeBody');
                this.usedCells.push(snakeCell);
            };
        });

        const foodCell = this.cells[`x${foodPoint.x}_y${foodPoint.y}`];
        foodCell.classList.add('food');
        this.usedCells.push(foodCell);


        barrierPointsArray.forEach((barrierPoint) => {
            const barrierCell = this.cells[`x${barrierPoint.x}_y${barrierPoint.y}`];
            barrierCell.classList.add('barrier');
            this.usedCells.push(barrierCell);
        });
    },
};

const snake = {
    config,
    body: null,
    direction: null,
    lastStepDirection: null,
    snakeRotation: false,

    init(startBody, direction) {
        this.body = startBody;
        this.direction = direction;
        this.lastStepDirection = direction;
    },

    getBody() {
        return this.body;
    },

    getLastStepDirection() {
        return this.lastStepDirection;
    },

    setDirection(direction) {
        this.direction = direction;
    },

    isOnPoint(point) {
        return this.body.some(snakePoint => snakePoint.x === point.x && snakePoint.y === point.y);
    },

    makeStep() {
        this.lastStepDirection = this.direction;
        this.body.unshift(this.getNextStepHeadPoint()); // [p3, p2, p1] // [p4, p3, p2]
        this.body.pop();
    },

    growUp() {
        const lastBodyIdx = this.getBody().length - 1;
        const lastBodyPoint = this.body[lastBodyIdx];
        const lastBodyPointClone = Object.assign({}, lastBodyPoint);
        this.body.push(lastBodyPointClone);
    },

    getNextStepHeadPoint() {
        let firstPoint = this.getBody()[0];
        let nextStep = null;
        this.snakeRotation = false;
        switch (this.direction) {
            case 'up':

                nextStep = { x: firstPoint.x, y: firstPoint.y - 1 };
                break;
            case 'right':

                nextStep = { x: firstPoint.x + 1, y: firstPoint.y };
                break;
            case 'down':

                nextStep = { x: firstPoint.x, y: firstPoint.y + 1 };
                break;
            case 'left':

                nextStep = { x: firstPoint.x - 1, y: firstPoint.y };
                break;
        };
        if (nextStep.x >= this.config.getColsCount()) {
            nextStep.x = 0;
            this.setDirection('right');
            this.snakeRotation = true;
        };
        if (nextStep.x < 0) {
            nextStep.x = this.config.getColsCount();
            this.setDirection('left');
            this.snakeRotation = true;

        };
        if (nextStep.y >= this.config.getRowsCount()) {
            nextStep.y = 0;
            this.setDirection('down');
            this.snakeRotation = true;
        };
        if (nextStep.y < 0) {
            nextStep.y = this.config.getRowsCount();
            this.setDirection('up');
            this.snakeRotation = true;
        };

        return nextStep;
    },

    getSnakeRotation() {
        return this.snakeRotation;
    }
};

const food = {
    x: null,
    y: null,

    getCoordinates() {
        return {
            x: this.x,
            y: this.y,
        };
    },

    setCoordinates(point) {
        this.x = point.x;
        this.y = point.y;
    },

    isOnPoint(point) {
        return this.x === point.x && this.y === point.y;
    },
};

const barrier = {
    x: null,
    y: null,
    barriers: [],

    getCoordinates() {
        return {
            x: this.x,
            y: this.y,
        };
    },

    setCoordinates(point) {
        this.x = point.x;
        this.y = point.y;
        this.barriers.push(this.getCoordinates())
    },

    isOnPoint(point) {
        return this.barriers.some(barrierPoint => barrierPoint.x === point.x && barrierPoint.y === point.y);
    },

    getBarriers() {
        return this.barriers
    },

    resetBarriers() {
        this.barriers = [];
    }
};

const status = {
    condition: null,

    setPlaying() {
        this.condition = 'playing';
    },

    setStopped() {
        this.condition = 'stopped';
    },

    setFinished() {
        this.condition = 'finished';
    },

    isPlaying() {
        return this.condition === 'playing';
    },

    isStopped() {
        return this.condition === 'stopped';
    },
};

const game = {
    config,
    map,
    snake,
    food,
    barrier,
    status,
    tickInterval: null,

    init(userSettings) {
        this.config.init(userSettings);
        const validation = this.config.validate();

        if (!validation.isValid) {
            for (const err of validation.errors) {
                console.error(err);
            }
            return;
        }

        this.map.init(this.config.getRowsCount(), this.config.getColsCount());

        this.setEventHandlers();
        this.reset();
    },

    reset() {
        this.stop();
        this.snake.init(this.getStartSnakeBody(), 'up');
        this.food.setCoordinates(this.getRandomFreeCoordinates());
        this.setRandomBarriers(this.config.getBarriersCount());
        this.scoreCounting();
        this.render();
    },

    play() {
        this.status.setPlaying();
        this.tickInterval = setInterval(() => this.tickHandler(), 1000 / this.config.getSpeed());
        this.setPlayButton('Стоп');
    },

    stop() {
        this.status.setStopped();
        clearInterval(this.tickInterval);
        this.setPlayButton('Старт');
    },

    finish() {
        this.status.setFinished();
        clearInterval(this.tickInterval);
        this.setPlayButton('Игра завершена', true);
    },

    tickHandler() {
        if (!this.canMakeStep()) {
            return this.finish();
        }

        if (this.food.isOnPoint(this.snake.getNextStepHeadPoint())) {
            this.snake.growUp();
            this.food.setCoordinates(this.getRandomFreeCoordinates());
            this.setRandomBarriers(this.config.getBarriersCount());
            this.scoreCounting();

            if (this.isGameWon()) {
                this.finish();
            }
        }

        this.snake.makeStep();
        this.render();
    },

    canMakeStep() {
        const nextHeadPoint = this.snake.getNextStepHeadPoint();
        return !this.snake.isOnPoint(nextHeadPoint) && !this.barrier.isOnPoint(nextHeadPoint);
    },

    isGameWon() {
        return this.snake.getBody().length > this.config.getWinFoodCount();
    },

    setPlayButton(text, isDisabled = false) {
        const playButton = document.getElementById('playButton');

        playButton.textContent = text;
        isDisabled ? playButton.classList.add('disabled') : playButton.classList.remove('disabled');
    },

    getStartSnakeBody() {
        return [
            {
                x: Math.floor(this.config.getColsCount() / 2),
                y: Math.floor(this.config.getRowsCount() / 2),
            }
        ];
    },

    getRandomFreeCoordinates() {
        const exclude = [this.food.getCoordinates(), ...this.snake.getBody(), ...this.barrier.getBarriers()];

        while (true) {
            const rndPoint = {
                x: Math.floor(Math.random() * this.config.getColsCount()),
                y: Math.floor(Math.random() * this.config.getRowsCount()),
            };

            if (!exclude.some(exPoint => rndPoint.x === exPoint.x && rndPoint.y === exPoint.y)) {
                return rndPoint;
            }
        }
    },

    setRandomBarriers(count) {
        if (this.barrier.getBarriers().length >= count) {
            this.barrier.resetBarriers();
        };

        for (let i = 0; i < count; i++) {
            this.barrier.setCoordinates(this.getRandomFreeCoordinates());
        };
    },


    setEventHandlers() {
        document.getElementById('playButton').addEventListener('click', () => {
            this.playClickHandler();
        });
        document.getElementById('newGameButton').addEventListener('click', () => {
            this.newGameClickHandler();
        });
        document.addEventListener('keydown', event => this.keyDownHandler(event));
    },

    render() {
        this.map.render(this.snake.getBody(), this.food.getCoordinates(), this.barrier.getBarriers());
    },

    playClickHandler() {
        if (this.status.isPlaying()) {
            this.stop();
        } else if (this.status.isStopped()) {
            this.play();
        }
    },

    newGameClickHandler() {
        this.reset();
    },

    keyDownHandler(event) {
        if (!this.status.isPlaying()) return;

        const direction = this.getDirectionByCode(event.code);

        if (this.canSetDirection(direction)) {
            this.snake.setDirection(direction);
        }
    },

    getDirectionByCode(code) {
        switch (code) {
            case 'KeyW':
            case 'ArrowUp':
                return 'up';
            case 'KeyD':
            case 'ArrowRight':
                return 'right';
            case 'KeyS':
            case 'ArrowDown':
                return 'down';
            case 'KeyA':
            case 'ArrowLeft':
                return 'left';
        }
    },

    canSetDirection(direction) {
        const lastStepDirection = this.snake.getLastStepDirection();
        const rotation = this.snake.getSnakeRotation();

        return direction === 'up' && lastStepDirection !== 'down' && !rotation ||
            direction === 'right' && lastStepDirection !== 'left' && !rotation ||
            direction === 'down' && lastStepDirection !== 'up' && !rotation ||
            direction === 'left' && lastStepDirection !== 'right' && !rotation;
    },

    scoreCounting() {
        document.querySelector('.scoreCount').textContent = `${(this.snake.getBody().length - 1)}`;
    }
};

game.init({ speed: 3, barriersCount: 2 });
