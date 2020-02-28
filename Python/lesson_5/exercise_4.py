# Lesson 5 exercise 4
# Создать (не программно) текстовый файл со следующим содержимым:
# One — 1
# Two — 2
# Three — 3
# Four — 4
# Необходимо написать программу, открывающую файл на чтение и считывающую построчно данные.
# При этом английские числительные должны заменяться на русские.
# Новый блок строк должен записываться в новый текстовый файл.
from os import path

RUS_SYMBOLS = {1: 'Один', 2: 'Два', 3: 'Три', 4: 'Четыре'}


def file_refactoring(file_name='text_4_en.txt'):
    """
    Функци выделяет словарь из исходного файла text_4_en.txt и заменяет ключи в нем на русские аналоги
    :param file_name: path to file by defaults text_4_en.txt
    :return: dict with rus keys
    """
    while not path.exists(file_name):
        file_name = r'' + input(
            f'Looks like file {file_name} doesn\'t exists please enter name of file for processing:\n')
    with open(file_name, 'r', encoding='UTF-8') as f:
        try:
            content_en = {i.rstrip('\n').split('—')[0]: i.rstrip('\n').split('—')[1] for i in f.readlines()}
            content_ru = {RUS_SYMBOLS[int(val)]: val for val in content_en.values()}
            return content_ru
        except ValueError:
            print(f'Looks like {file_name} have mistake in data!')
        except IndexError:
            print(f'Please check {file_name} content, looks like not all data was filled in!')


def file_writing(content, file_name='text_4_ru.txt'):
    """
    Функция записи файла с проверкой на наличие файла text_4_ru.txt
    :param content: dict
    :param file_name: по умолчанию text_4_ru.txt
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
        [print(f'{key} —{val}', file=f) for key, val in content.items()]


file_writing(file_refactoring())
