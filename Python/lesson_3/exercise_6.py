# Lesson 3 Exercise 6
# Реализовать функцию int_func(), принимающую слово из маленьких латинских букв и возвращающую его же,
# но с прописной первой буквой. Например, print(int_func(‘text’)) -> Text.
# Продолжить работу над заданием. В программу должна попадать строка из слов, разделенных пробелом.
# Каждое слово состоит из латинских букв в нижнем регистре. Сделать вывод исходной строки,
# но каждое слово должно начинаться с заглавной буквы. Необходимо использовать написанную ранее функцию int_func().


def int_func(text):
    """
    Функция выводит исходное слово, но с прописной первой буквой
    :param text: str
    :return: str
    """
    return text[0].upper()+text[1:].lower()


def int_func_second(text_str):
    """
    Функция использует предыдущую и выводит строку из слов с заглавными
    :param text_str: str
    :return: str
    """
    try:
        result = ''
        text_str = text_str.split()
        for elem in text_str:
            result += int_func(elem) + ' '
        return print(result)
    except ValueError:
        print('Please insert string!')


print('First function:')
print(int_func(input('Please insert your word - ')))
print('Second function:')
int_func_second(input('Please insert your string - '))
