const result = {
    'единицы': 0,
    'десятки': 0,
    'сотни': 0
}

function getObject(num = prompt('Введите число от 0 до 999')) {
    if (!Number.isInteger(+num) || num.length > 3 || num < 0) {
        console.log('Вводить нужно целое число от 0 до 999!\n')
        return {}
    } else {
        result['сотни'] = Math.floor(+num / 100)
        result['десятки'] = Math.floor(+num / 10 % 10)
        result['единицы'] = Math.floor(+num % 10)
        return result
    }
}

console.log(getObject())
