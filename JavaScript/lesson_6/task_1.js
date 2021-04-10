const productCards = {
    cardGallery,
    productCardCatalog(product) {
        let card = `<div class="product">
        ${cardGallery.productCardGallery(product)}
        <p><i>Название: </i>${product.productName}</p>
        <p><i>Цена за ед.: </i>${product.price}</p>
        <button class="buy_button" product_id="${product.id}">Купить</button>
        </div>`;
        return card
    },

    productCardBasket(product) {
        let card = `<div class="product">
        <p><i>Название: </i>${product.productName}</p>
        <p><i>Цена за ед.: </i>${product.price}</p>
        <p><i>Количество: </i>${product.quantity}</p>
        <p><i>Стоимость: </i>${product.price * product.quantity}</p>
        </div>`
        return card
    },
}

const basket = {
    productCards,
    basketStyle:
        `\n
    .basket {
        margin-top: 25px;
        display: flex;
        flex-flow: row wrap;
        justify-content: center;
    }
        
    .basket_price {
        align-self: stretch;
        flex-grow: 1;
        width: 100%;
        padding: 10px;
        text-align: center;
        margin: auto;
        order: 1;
    }
    .clean_button {
        display: block;
        padding: 10px;
        text-align: center;
        margin: 10px auto;
    }
        `,

    productsList: [],

    init() {
        this.initStyle();
        document.body.insertAdjacentHTML('beforeend', '<div class="basket"></div>');
        this.drawProductsList();
        this.cleanButton();
    },

    initStyle() {
        if (document.querySelector('style')) {
            document.querySelector('style').innerHTML += this.basketStyle;
        } else {
            const style = document.createElement('style');
            style.setAttribute('type', "text/css");
            style.innerHTML = this.basketStyle;
            document.querySelector('head').appendChild(style);
        }
    },

    countBasketPrice(result = 0) {
        this.productsList.forEach((item) => {
            result += item.price * item.quantity;
        })
        return result
    },

    countProductsQuantity(result = 0) {
        this.productsList.forEach((item) => {
            result += item.quantity;
        })
        return result
    },

    drawProductsList() {
        if (this.productsList.length) {
            document.querySelector('.basket').textContent = "";
            this.productsList.forEach((product) => {
                document.querySelector('.basket').insertAdjacentHTML('beforeend', productCards.productCardBasket(product));
            })
            document.querySelector('.basket').insertAdjacentHTML('beforeend', `<div class="basket_price"> <p> В вашей корзине <b>${this.countProductsQuantity()}</b> товаров на сумму <b>${this.countBasketPrice()}</b> рублей! </p> </div>`);
        } else {
            document.querySelector('.basket').textContent = 'Ваша корзина пуста!';
        }
    },

    cleanButton() {
        document.body.insertAdjacentHTML('beforeend', '<button class="clean_button">Очистить корзину</button>');
        const button = document.querySelector('.clean_button');
        button.addEventListener('click', () => this.cleanBasket());
    },

    cleanBasket() {
        this.productsList = [];
        this.drawProductsList();
    }

}

const catalog = {
    gallery,
    productCards,
    basket,
    goods: [
        { id: 1, productName: 'Молоко', price: 100, quantity: 1 },
        { id: 2, productName: 'Печенье', price: 45, quantity: 1 },
        { id: 3, productName: 'Хлеб', price: 50, quantity: 1 }
    ],

    catalogStyle:
        `
    .catalog {
        margin-top: 25px;
        display: flex;
        flex-flow: row wrap;
        justify-content: center;
    }

    .product {
        border: 1px solid black;
        background-color: lightgrey;
        width: 30%;
        margin: 10px;
        padding: 10px;
        flex-grow: 1;
        order: 0;
        text-align: center;
    }`,

    init() {
        this.initStyle();
        this.drawCatalog();
        gallery.init();
    },

    initStyle() {
        if (document.querySelector('style')) {
            document.querySelector('style').innerHTML += this.catalogStyle;
        } else {
            const style = document.createElement('style');
            style.setAttribute('type', "text/css");
            style.innerHTML = this.catalogStyle;
            document.querySelector('head').appendChild(style);
        }
    },

    drawCatalog() {
        document.body.insertAdjacentHTML('afterbegin', '<div class="catalog"></div>');
        document.querySelector('.catalog').insertAdjacentHTML('afterend', '<hr>');
        if (this.goods.length) {
            this.goods.forEach((product) => {
                document.querySelector('.catalog').insertAdjacentHTML('beforeend', productCards.productCardCatalog(product));
                gallery.doHendlersForButtons(product);
            })
            this.buyButtonClick();
        } else {
            document.querySelector('.catalog').textContent = 'Каталог товаров пуст!';
        }
    },

    buyButtonClick() {
        document.querySelectorAll('.buy_button').forEach((button) => {
            button.addEventListener('click', () => {
                this.addToBasket(button.getAttribute('product_id'))
            })
        })
    },

    addToBasket(productId) {
        let selectedGood = this.goods.find(product => product.id == productId);
        let addedProduct = basket.productsList.find(product => product.id == selectedGood.id)
        if (addedProduct) {
            addedProduct.quantity += 1;
        } else {
            basket.productsList.push(Object.assign({}, selectedGood));
        }
        basket.drawProductsList();
    }
}

basket.init();
catalog.init();