# Lesson 5 exercise 7
# Создать вручную и заполнить несколькими строками текстовый файл,
# в котором каждая строка должна содержать данные о фирме: название, форма собственности, выручка, издержки.
# Пример строки файла: firm_1   ООО   10000   5000.
# Необходимо построчно прочитать файл, вычислить прибыль каждой компании, а также среднюю прибыль.
# Если фирма получила убытки, в расчет средней прибыли ее не включать.
# Далее реализовать список. Он должен содержать словарь с фирмами и их прибылями,
# а также словарь со средней прибылью. Если фирма получила убытки, также добавить ее в словарь (со значением убытков).
# Пример списка: [{“firm_1”: 5000, “firm_2”: 3000, “firm_3”: 1000}, {“average_profit”: 2000}].
# Итоговый список сохранить в виде json-объекта в соответствующий файл.
# Пример json-объекта:
# [{"firm_1": 5000, "firm_2": 3000, "firm_3": 1000}, {"average_profit": 2000}]
from os import path
import json


def file_reading(file_name='text_7.txt'):
    """
    Функция считывает файл text_7.txt с проверкой на наличие файла и его наполненность
    :param file_name: str path to file, by default text_7.txt
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


def file_writing(user_data, file_name='text_7.json'):
    """
    Функция записывает файл text_7.json с проверкой на наличие файла
    :param file_name: str path to file, by default text_7.json
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
        f.write(json.dumps(user_data))
        return print(f'Result was writen to {file_name}')


def profit(user_list, result=0):
    """
    Функция вычисляет прибыль фирмы
    :param user_list: list of numbers
    :param result: 0 by default
    :return: float
    """
    if len(user_list) >= 2:
        result = user_list[0] - user_list[1]
    else:
        print(f'Not enough data for calculation! Profit will be set to 0, please check source file')
    return result


def proceed_data(file_text):
    """
    Функция получает на вход список строк, разделяет их для добавления в словари со значинями прибылей/убытков и
    словарь средней прибыли не включающей убыточные компании
    :param file_text: list of strings
    :return: list of dicts
    """
    profit_dict = {}

    for elem in file_text:
        elem = elem.replace('\n', '').split(' ')
        profit_dict.update({elem[0]: profit([float(i) for i in elem[1:] if i.isdigit()])})
    positive_profit = [i for i in profit_dict.values() if i >= 0]
    average_profit = {"average_profit": sum(positive_profit) / len(positive_profit)}
    return [profit_dict, average_profit]


file_writing(proceed_data(file_reading()))
