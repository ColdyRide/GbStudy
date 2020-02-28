# Lesson 5 exercise 5
# Создать (программно) текстовый файл, записать в него программно набор чисел, разделенных пробелами.
# Программа должна подсчитывать сумму чисел в файле и выводить ее на экран.
from os import path
import random


def file_writing(file_name='text_5.txt'):
    """
    Функция записывает файл text_5.txt с проверкой на наличие файла
    :param file_name: str path to file, by default text_5.txt
    :return: file in cwd
    """
    while path.exists(file_name):
        _ = input(f'Looks like file {file_name} all-ready exists, '
                  f'please insert new name, or just press Enter for rewriting:\n')
        if not _:
            break
        else:
            file_name = _
    with open(r'' + file_name, 'w', encoding='UTF-8') as f:
        [print(random.randint(i, 20), file=f, end=' ') for i in range(20)]
        return file_name


def counting(file_name):
    """
    Функция считает сумму числе в указанном файле
    :param file_name: str path to file
    :return: print sum
    """
    while not path.exists(file_name):
        file_name = r'' + input(
            f'Looks like file {file_name} doesn\'t exists please enter name of file for processing:\n')
    with open(r'' + file_name, encoding='UTF-8') as f:
        try:
            print(f'Sum of numbers in {file_name} is {sum([int(val) for val in f.read().split()])}')
        except ValueError:
            print(f'Looks like in {file_name} not only a integer numbers! Check it please')


counting(file_writing())
