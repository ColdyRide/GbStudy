# Lesson 4 exercise 5
# Реализовать два небольших скрипта:
# а) бесконечный итератор, генерирующий целые числа, начиная с указанного,
# б) бесконечный итератор, повторяющий элементы некоторого списка, определенного заранее.
from itertools import count, cycle


def gen_list():
    """
    Функция формирует бесконечную последовательность начиная с указанного числа
    :return: inf list
    """
    try:
        return count(float(input('Please inset start number - ')))
    except ValueError:
        print('Please use only numbers, not words!')


result = cycle(gen_list())
print('Press enter for next value for exit just insert something')
while not input():
    print(next(result))
