# Lesson 4 Exercise 2
# Представлен список чисел. Необходимо вывести элементы исходного списка, значения которых больше предыдущего элемента.


def generator(user_list):
    """
    Функция для получения генератора из списка
    :param user_list: list of numbers
    :return: generator
    """
    try:
        for elem in user_list.split():
            yield float(elem)
    except ValueError:
        print('Please use numbers, not words!')


raw_gen = generator(input('Please insert your list, separate by space - '))

for i in raw_gen:
    j = next(raw_gen)
    if i < j:
        print(j, end=' ')
