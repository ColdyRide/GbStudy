# Lesson 5 exercise 3
# Создать текстовый файл (не программно), построчно записать фамилии сотрудников и величину их окладов.
# Определить, кто из сотрудников имеет оклад менее 20 тыс.,
# вывести фамилии этих сотрудников. Выполнить подсчет средней величины дохода сотрудников.
from os import path


def file_opening(file_name='text_3.txt'):
    """
    Функция принимает в обработку файл содержащий данные о сотрудника, определяет сотрудников с откладом ниже порога.
    Подсчитывает средний доход
    :param file_name: path to file by defaults text_3.txt
    :return: first - name of employee with low salary, second average salary
    """
    while not path.exists(file_name):
        file_name = r'' + input(
            f'Looks like file {file_name} doesn\'t exists please enter name of file for processing:\n')
    with open(file_name, 'r', encoding='UTF-8') as f:
        try:
            content = {i.rstrip('\n').split()[0]: i.rstrip('\n').split()[1] for i in f.readlines()}
            return print('\nSalary grade lower 20 thousand:'), \
                   [print(i) for i, j in content.items() if float(j) < 20000], \
                   print(f'\nAverage salary is {sum([float(i) for i in content.values()]) / len(content.keys())}')
        except ValueError:
            print(f'Looks like {file_name} have mistake in personal data for one of employees!')
        except IndexError:
            print(f'Please check {file_name} content, looks like not all data was filled in!')


file_opening()
