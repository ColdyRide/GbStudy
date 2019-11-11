# Lesson 4 Exercise 7
# Реализовать генератор с помощью функции с ключевым словом yield, создающим очередное значение.
# При вызове функции должен создаваться объект-генератор.
# Функция должна вызываться следующим образом: for el in fibo_gen().
# Функция отвечает за получение факториала числа, а в цикле необходимо выводить только первые 15 чисел.
from itertools import repeat


def fibo_gen(num):
    """
    Функция для создания последовательности факториала заданого числа
    :param num: int
    :return: generator
    """
    result = 1
    try:
        for i in range(1, int(num) + 1):
            result *= i
            yield result
    except ValueError:
        print('Please insert integer number!')


count = 0
for el in fibo_gen(input('Please insert number for factorial - ')):
    print(el)
    count += 1
    if count > 14:
        break
