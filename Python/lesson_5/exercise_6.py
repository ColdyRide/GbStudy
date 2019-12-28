# Lesson 5 exercise 6
# Необходимо создать (не программно) текстовый файл, где каждая строка описывает учебный предмет и наличие лекционных,
# практических и лабораторных занятий по этому предмету и их количество.
# Важно, чтобы для каждого предмета не обязательно были все типы занятий.
# Сформировать словарь, содержащий название предмета и общее количество занятий по нему. Вывести словарь на экран.
# Примеры строк файла: Информатика:   100(л)   50(пр)   20(лаб).
#                      Физика:   30(л)   —   10(лаб)
#                      Физкультура:   —   30(пр)   —
# Пример словаря: {“Информатика”: 170, “Физика”: 40, “Физкультура”: 30}
from os import path


def file_reading(file_name='text_6.txt'):
    """
    Функция считывает файл text_6.txt с проверкой на наличие файла и его наполненность
    :param file_name: str path to file, by default text_6.txt
    :return: file in cwd
    """
    file_text = []
    while not path.exists(file_name) or not file_text:
        try:
            with open(file_name, 'r', encoding='UTF-8') as f:
                file_text = f.readlines()
                if file_text:
                    break
        except FileNotFoundError:
            continue
        _ = input(f'Looks like file {file_name} does not exists or doesn`t content anything, '
                  f'please insert name, of correct file:\n')
        if not _:
            continue
        else:
            file_name = _
    return file_text


def sum_elements(user_list, result=0):
    """
    Функция суммирует элементы списка
    :param user_list: list of numbers
    :param result: by default = 0
    :return: float
    """
    for i in user_list:
        result += float(i)
    return result


def proceed_data(file_text):
    """
    Функция получает на вход список строк, разделяет их для добавления в словарь и сумирует числа, если они есть
    :param file_text: list of strings
    :return: dict
    """
    result_dict = {}
    for elem in file_text:
        elem = elem.replace('\n', '').replace('(', ' ').replace(')', ' ').split(':')
        result_dict.update({elem[0]: sum_elements([i for i in elem[1].split(' ') if i.isdigit()])})
    return print(result_dict)


proceed_data(file_reading())
