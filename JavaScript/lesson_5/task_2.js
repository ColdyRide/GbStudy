const basket = {
    basketStyle:
        `\n
        .basket {
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
        }
        
        .basket_price {
            align-self: stretch;
            flex-grow: 1;
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
        `,

    productsList: [
        { productName: 'Молоко', price: 100, quantity: 5 },
        { productName: 'Печенье', price: 45, quantity: 2 },
        { productName: 'Хлеб', price: 50, quantity: 1 }
    ],

    // productsList: [],

    init() {
        this.initStyle();
        document.body.insertAdjacentHTML('beforeend', '<div class="basket"></div>');
        document.querySelector('.basket').insertAdjacentHTML('beforebegin', '<hr>');
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

    productCard(product) {
        let card = `<div class="product">
        <p><i>Название: </i>${product.productName}</p>
        <p><i>Цена за ед.: </i>${product.price}</p>
        <p><i>Количество: </i>${product.quantity}</p>
        <p><i>Стоимость: </i>${product.price * product.quantity}</p>
        </div>`
        return card
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
            this.productsList.forEach((product) => {
                document.querySelector('.basket').insertAdjacentHTML('beforeend', this.productCard(product));
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


basket.init();
