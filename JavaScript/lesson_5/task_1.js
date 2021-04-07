const chessBoard = {
    white: ['\u2656', '\u2658', '\u2657', '\u2655', '\u2654', '\u2659'],
    black: ['\u265c', '\u265e', '\u265d', '\u265b', '\u265a', '\u265f'],

    draw() {
        this.initStyle();
        this.createTable();
        this.putFigures(this.white);
        this.putFigures(this.black)
    },

    initStyle() {
        const style = document.createElement('style');
        style.setAttribute('type', 'text/css');
        style.innerHTML = `
        table {
            border-collapse: collapse;
            margin: auto;
            text-align: center;
        }

        td {
            background-color: lightgrey;
            height: 50px;
            width: 50px;
        }

        .map_td {
            height: 50px;
            width: 50px;
            border: 0.5px solid black;
            background-color: gray;
            font-size: 26px;
        }

        .map_tr:nth-child(odd) .map_td:nth-child(odd) {
            background-color: white;
        }

        .map_tr:nth-child(even) .map_td:nth-child(even) {
            background-color: white;
        }`;
        document.querySelector('head').appendChild(style);
    },

    createTable() {
        document.body.insertAdjacentHTML('afterbegin', `<table>${`<tr class="map_tr">${'<td class="map_td"></td>\n'.repeat(8)}</tr>\n`.repeat(8)}</table>`);
        this.doNumering();
    },

    doNumering() {
        const cols = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'];
        const table = document.querySelector('table');
        const rows = table.rows;
        table.insertRow(0);
        table.insertRow(-1);

        for (let i = 0; i <= 9; i++) {
            let upperCell = rows[0].insertCell(i);
            let bottomCell = rows[9].insertCell(i);
            if (9 > i && i >= 1) {
                upperCell.innerText = cols[i - 1];
                bottomCell.innerText = cols[i - 1];
            }
        }
        for (let i = 1, j = 8; i <= 8; i++, j--) {
            let rightCell = rows[i].insertCell(0)
            let leftCell = rows[i].insertCell(-1)
            rightCell.innerText = j.toString()
            leftCell.innerText = j.toString()
        }
    },

    putFigures(color) {
        const table = document.querySelector('table');
        const rows = table.rows;
        let startNumber = 8;
        let endNumber = 7;
        if (color === this.black) {
            startNumber = 1;
            endNumber = 2;
        }
        for (let i = 0; i <= 7; i++) {
            if (i < 5) {
                rows[startNumber].cells[i + 1].innerText = color[i];
            } else {
                rows[startNumber].cells[i + 1].innerText = color[7 - i];
            }
            rows[endNumber].cells[i + 1].innerText = color[5];
        }
    }

}

chessBoard.draw()
