const basket = {
    productsList: [
        { productName: 'Молоко', price: 100, quantity: 5 },
        { productName: 'Печенье', price: 45, quantity: 2 },
        { productName: 'Хлеб', price: 50, quantity: 1 }
    ],

    countBasketPrice(result = 0) {
        this.productsList.forEach((item) => {
            result += item.price * item.quantity
        })
        return result
    }
}

console.log(basket.countBasketPrice())
