# Lesson 3 Exercise 1
# Реализовать функцию, принимающую два числа (позиционные аргументы) и выполняющую их деление.
# Числа запрашивать у пользователя, предусмотреть обработку ситуации деления на ноль.


def div_func(number_1, number_2):
    """
    Функция деления одного числа на другое, реализована проверка числового ввода и деления на ноль
    :param number_1: str, позиционный
    :param number_2: str, позиционный
    :return: float результат в описательной строке
    """
    try:
        return print(f'{number_1}:{number_2} = {float(number_1)/float(number_2)}')
    except ZeroDivisionError:
        print('Sorry, but I can\'t proceed zero division operations')
    except ValueError:
        print('Looks like you\'re used not numbers')


div_func(input('Please first number - '), input('Please second number - '))
