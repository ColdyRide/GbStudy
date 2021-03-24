function toFareng() {
    let tempCels = parseFloat(prompt('Введите температуру в градусах Цельсия: '));
    return (9 / 5) * tempCels + 32;
}

alert(toFareng());
