const cardGallery = {
    productCardGallery(product) {
        let card = `<div class="gallery">
        <div class="prev" product_id="${product.id}"> &lt</div>
        <div class="line">
            <ul class="img_set" product_id="${product.id}">
                <li><img src="./img/milk_1.png" alt="img" class="image"></li>
                <li><img src="./img/milk_2.png" alt="img" class="image"></li>
            </ul>
        </div>
        <div class="next" product_id="${product.id}"> &gt </div>
    </div>`
        return card;
    }
}

const gallery = {
    step: 150,
    galleryStyle:
        `
    .gallery {
        max-width: 170px;
        display: flex;
        margin: auto;
    }

    .line {
        display: block;
        overflow: hidden;
    }

    .img_set {
        list-style: none;
        display: inline-flex;
        width: 99999px;
        margin-left: 0px;
        padding: 0;
        align-items: center;
        transition: margin-left 250ms;
    }

    .prev,
    .next {
        min-width: 10px;
        display: flex;
        font-size: 20px;
        font-weight: bold;
        align-items: center;
    }

    .next:hover,
    .prev:hover {
        font-size: 25px;
    }

    .image {
        width: 150px;
    }

    .image_big {
        position: absolute;
        top: 45%;
        left: 45%;
        transform: scale(2.5);
        z-index: 2;
    }

    .background {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: grey;
        opacity: 0.8;
        z-index: 1;
    }

    .close_img {
        width: 50px;
        height: 50px;
        position: relative;
        left: 90%;
        top: 10%;
        z-index: 3;
    }

    .hidden {
        display: none;
    }`,

    init() {
        this.initStyle();
        document.body.insertAdjacentHTML('beforeend', `<div class="background hidden">
        <img src="./img/close.png" alt="close_img" class="close_img hidden"></div>`);
        document.querySelectorAll('.image').forEach((item) => {
            item.addEventListener('click', () => {
                item.classList.toggle('image_big');
                document.querySelector('.background').classList.toggle('hidden');
                document.querySelector('.close_img').classList.toggle('hidden');
            })
        })
        document.querySelector('.close_img').addEventListener('click', () => {
            document.querySelector('.image_big').classList.toggle('image_big');
            document.querySelector('.background').classList.toggle('hidden');
            document.querySelector('.close_img').classList.toggle('hidden');
        })

    },

    initStyle() {
        if (document.querySelector('style')) {
            document.querySelector('style').innerHTML += this.galleryStyle;
        } else {
            const style = document.createElement('style');
            style.setAttribute('type', "text/css");
            style.innerHTML = this.galleryStyle;
            document.querySelector('head').appendChild(style);
        }
    },


    doHendlersForButtons(product) {
        document.querySelectorAll(`.next[product_id="${product.id}"]`).forEach((item) => {
            item.addEventListener('click', () => {
                this.moveNext(product.id);
            })
        })
        document.querySelectorAll(`.prev[product_id="${product.id}"]`).forEach((item) => {
            item.addEventListener('click', () => {
                this.movePrev(product.id);
            })
        })
    },

    getCurrentMargin(productId) {
        let currentMargin = document.querySelector(`.img_set[product_id="${productId}"]`).style.marginLeft;
        if (isNaN(parseInt(currentMargin))) {
            return 0;
        } else {
            return parseInt(currentMargin);
        }
    },

    moveNext(productId) {
        const maxPos = -(document.querySelector(`.img_set[product_id="${productId}"]`).querySelectorAll('li').length - 1) * this.step;
        let currentPos = this.getCurrentMargin(productId) - this.step;
        currentPos = Math.max(currentPos, maxPos);
        document.querySelector(`.img_set[product_id="${productId}"]`).style.marginLeft = currentPos + 'px';
    },

    movePrev(productId) {
        const minPos = 0;
        let currentPos = this.getCurrentMargin(productId) + this.step;
        currentPos = Math.min(currentPos, minPos);
        document.querySelector(`.img_set[product_id="${productId}"]`).style.marginLeft = currentPos + 'px';
    }
}
