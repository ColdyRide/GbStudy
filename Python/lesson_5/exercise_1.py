# Lesson 5 exercise 1
# Создать программно файл в текстовом формате, записать в него построчно данные, вводимые пользователем.
# Об окончании ввода данных свидетельствует пустая строка.
from os import path


def user_input():
    """
    Функция считывает ввод пользователя до ввода пустой строки
    :return: list of str
    """
    user_line = input('Please insert your text in the end inset empty line below:\n ')
    raw_input = [user_line]
    while user_line:
        user_line = input()
        raw_input.append(user_line)
    return raw_input


def file_writing(file_name='text_1.txt'):
    """
    Функция записи файла с проверкой на наличие файла text_1.txt
    :param file_name: по умолчанию text_1.txt
    :return: file в рабочей дирректории
    """
    while path.exists(file_name):
        _ = input(f'Looks like file {file_name} all-ready exists, '
                  f'please insert new name, or just press Enter for rewriting:\n')
        if not _:
            break
        else:
            file_name = _
    with open(r'' + file_name, 'w', encoding='UTF-8') as f:
        f.writelines([i + '\n' for i in user_input() if i])


file_writing()
