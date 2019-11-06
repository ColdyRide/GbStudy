# Lesson 3 Exercise 4
# Программа принимает действительное положительное число x и целое отрицательное число y.
# Необходимо выполнить возведение числа x в степень y.
# Задание необходимо реализовать в виде функции my_func(x, y).
# При решении задания необходимо обойтись без встроенной функции возведения числа в степень.
# Попробуйте решить задачу двумя способами.
# Первый — возведение в степень с помощью оператора **.
# Второй — более сложная реализация без оператора **, предусматривающая использование цикла.


def my_func_first(x, y):
    """
    Функция принимает два аргумента - первый положительный, второй целый и отрицательный, результатом является
    возведение первого в степень равную второму.
    :param x: positive int or float,
    :param y: negative int number,
    :return: float
    """
    print('\nFirst variant with ** operator')
    try:
        if int(y) > 0 or float(x) < 0:
            raise ValueError
        return print(f"\nResult {x} ^ {y} = {float(x) ** int(y)}")
    except ValueError:
        print('Looks like you insert not numbers or your Y isn\'t negative and integer, may be your X is\'t positive?')


def my_func_second(x, y):
    """
    Функция принимает два аргумента - первый положительный, второй целый и отрицательный, результатом является
    возведение первого в степень равную второму.
    :param x: positive int or float,
    :param y: negative int number,
    :return: float, рекурсия или 1 деленная на первый аргумент
    """
    try:
        if int(y) > 0 or float(x) < 0:
            raise ValueError
        if int(y) == -1 and float(x) > 0:
            return 1 / float(x)
        else:
            return 1 / float(x) * my_func_second(float(x), int(y) + 1)
    except ValueError:
        print('Looks like you insert not numbers or your Y isn\'t negative and integer, may be your X is\'t positive?')


x_argument = input('Please insert your X, it\'s must be positive - ')
y_argument = input('Please insert your Y, it\'s must be negative int - ')
my_func_first(x_argument, y_argument)
print('\nSecond variant, but without cycles')
if my_func_second(x_argument, y_argument):
    print(f"\nResult {x_argument} ^ {y_argument} = {my_func_second(x_argument, y_argument)}")
