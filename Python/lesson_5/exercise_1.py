# Lesson 4 Exercise 1
# Реализовать скрипт, в котором должна быть предусмотрена функция расчета заработной платы сотрудника.
# В расчете необходимо использовать формулу: (выработка в часах*ставка в час) + премия.
# Для выполнения расчета для конкретных значений необходимо запускать скрипт с параметрами.
from sys import argv


def salary():
    """
    Функция принимает в качечестве аргументов параметры запуска скрипта Выроботка в часах, ставка, премия
    :return: float в строке
    """
    try:
        return print(f'Your salary include bonus - {float(argv[1]) * float(argv[2]) + float(argv[3]):.2f}')
    except ValueError:
        print('Please used numbers like parameters')


salary()
