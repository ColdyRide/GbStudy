function mathOperation(
    arg1 = parseFloat(prompt('Ввведите первое число: ')),
    arg2 = parseFloat(prompt('Ввведите второе число: ')),
    operation = prompt('Введите операцию из следующих + - * /')) {
    if (isNaN(arg1) || isNaN(arg2))
        return alert('Что-то из введенного - не число! Попробуйте в следующий раз.');
    switch (operation) {
        case '+':
            return mySum(arg1, arg2);
        case '-':
            return mySub(arg1, arg2);
        case '*':
            return myMul(arg1, arg2);
        case '/':
            return myDiv(arg1, arg2);
        default:
            return alert('Такой операции не найдено, попробуйте позже.');
    }
}

alert(mathOperation());
