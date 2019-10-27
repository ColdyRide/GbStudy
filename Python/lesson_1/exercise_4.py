# Lesson 1 - Exercise number 4
# Пользователь вводит целое положительное число. Найдите самую большую цифру в числе.
# Для решения используйте цикл while и арифметические операции.
number = int(input('Please, insert positive integer number - '))
maximum_digit = 0
while number > 0:
    while (number % 10) > maximum_digit:
        maximum_digit = number % 10
    number //= 10
print('Maximum digit is - ', maximum_digit)
