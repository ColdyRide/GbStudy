function power(
    val = parseFloat(prompt('Введите число: ')),
    pow = parseInt(prompt('Введите положительную целую степень: '))) {
    if (pow < 0) {
        return alert('Вы ввели отрицательную степень')
    }
    if (pow == 0) {
        return alert(1);
    }
    if (pow == 1) {
        return alert(val);
    }
    else {
        return power(val *= val, --pow);
    }
}

power();
