function countBasketPrice(basket) {
    let result = 0;
    basket.forEach((item) => {
        result += item[1] * item[2];
    })
    return console.log('Цена товаров в корзине - ' + result + ' руб.');
}


let basket = [
    ['Печенье', 3, 100],
    ['Молоко', 1, 50],
    ['Рис', 2, 25]
]


countBasketPrice(basket)
