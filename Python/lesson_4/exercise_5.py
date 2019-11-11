# Lesson 4 exercise 5
# Реализовать формирование списка, используя функцию range() и возможности генератора.
# В список должны войти четные числа от 100 до 1000 (включая границы).
# Необходимо получить результат вычисления произведения всех элементов списка.
from functools import reduce


def multiply(elem_1, elem_2):
    """
    Функция по перемножению 2 элементов
    :param elem_1: int or float
    :param elem_2: int or float
    :return: int or float
    """
    return elem_1 * elem_2


def even_list():
    """
    Функция формирует лист четных значений из диапазона от 100 до 1000 включительно
    :return: list
    """
    return [i for i in range(100, 1001) if not i % 2]


print(f'Result of multiply all even elements from 100 to 1000 inclusive - {reduce(multiply, even_list())}')
