# Lesson 3 Exercise 5
# Программа запрашивает у пользователя строку чисел, разделенных пробелом.
# При нажатии Enter должна выводиться сумма чисел.
# Пользователь может продолжить ввод чисел, разделенных пробелом и снова нажать Enter.
# Сумма вновь введенных чисел будет добавляться к уже подсчитанной сумме.
# Но если вместо числа вводится специальный символ, выполнение программы завершается.
# Если специальный символ введен после нескольких чисел,
# то вначале нужно добавить сумму этих чисел к полученной ранее сумме и после этого завершить программу.


def cont_sum(prev_sum=0, user_data=[]):
    """
    Функция суммирует ввод пользователя, завершается по символу Q
    :param prev_sum: float
    :param user_data: list
    :return: float
    """
    try:
        if 'Q' in user_data:
            user_data.remove('Q')
            return print(f"Current sum = {sum([float(i) for i in user_data], prev_sum)}")
        else:
            user_data = input('Please insert numbers for summarize, it\'s must be separated by space - ').split()
            if 'Q' in user_data:
                user_data.remove('Q')
                return print(f"Current sum = {sum([float(i) for i in user_data], prev_sum)}")
            print(f"Current sum = {sum([float(i) for i in user_data], prev_sum)}")
        return cont_sum(sum([float(i) for i in user_data], prev_sum))
    except ValueError:
        print('Looks like you are not insert correct values, so I can\'t sum it')


print("If you wanna exit just insert Q")
cont_sum()
