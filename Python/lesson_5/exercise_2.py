# Lesson 5 exercise 2
# Создать текстовый файл (не программно), сохранить в нем несколько строк,
# выполнить подсчет количества строк, количества слов в каждой строке.
from os import path


def file_opening(file_name='text_2.txt'):
    """
    Функция открывает файл, только если он существует после чистит строки от \n и считает строки со словами строках.
    Если файл пуст выводит сообщение об этом
    :param file_name: path to file by defaults text_2.txt
    :return: list of strings
    """
    while not path.exists(file_name):
        file_name = r'' + input(
            f'Looks like file {file_name} doesn\'t exists please enter name of file for processing:\n')
    with open(file_name, 'r', encoding='UTF-8') as f:
        content = [i.rstrip('\n') for i in f.readlines()]
        if not content:
            return print(f'Your {file_name} is empty')
        word_number = {i: len(j.split()) for i, j in enumerate(content, 1)}
    return print(f'Total row count - {len(word_number.keys())}'), \
           [print(f'In row {i} are {j} words') for i, j in word_number.items()]


file_opening()
