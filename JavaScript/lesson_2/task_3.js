var a, b;

function testSign(a = parseInt(prompt('Введите целое число а :')), b = parseInt(prompt('Введите целое число b :'))) {
    let result = Math.sign(a) + Math.sign(b);
    if (isNaN(a) || isNaN(b))
        return alert('Что-то из введенного - не число попробуйте в следующий раз');
    else if (result >= 1)
        return alert(a - b);
    else if (result < 0)
        return alert(a * b);
    else if (result == 0)
        return alert(a + b);
}

testSign();
