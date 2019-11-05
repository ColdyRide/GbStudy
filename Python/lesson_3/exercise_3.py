# Lesson 3 Exercise 3
# Реализовать функцию my_func(), которая принимает три позиционных аргумента,
# и возвращает сумму наибольших двух аргументов.


def my_func(*args):
    """
    Функция возвращающая сумму двух максимальных элементов, пробуем цифры, если нет - тогда строки
    :param args: str, позиционные
    :return: str, описательная строка с результатом
    """
    try:
        return print(f"Sum of two max elements - "
                     f"{float(sorted(args, reverse=True)[0]) + float(sorted(args, reverse=True)[1])}")
    except ValueError:
        return print(f"Sum of two max elements - "
                     f"{sorted(args, reverse=True)[0] + sorted(args, reverse=True)[1]}")


my_func(input('Please insert first argument - '),
        input('Please insert second argument - '),
        input('Please insert third argument - '))
