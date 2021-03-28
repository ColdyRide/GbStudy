function getRandomIntInclusive(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

function logRandNum(a = getRandomIntInclusive(0, 15)) {
    switch (a) {
        case 15:
            return alert(a);
        default:
            alert(a++);
            return logRandNum(a);
    }
}

logRandNum();
