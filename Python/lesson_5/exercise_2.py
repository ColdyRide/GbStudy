# Lesson 4 Exercise 2
# Представлен список чисел. Необходимо вывести элементы исходного списка, значения которых больше предыдущего элемента.

user_list = input('Please insert your list, separate by space - ').split()
try:
    result = [user_list[i] for i in range(1, len(user_list)) if float(user_list[i]) > float(user_list[i - 1])]
    print('Result - ', end=' ')
    [print(i, end=' ') for i in result]
except ValueError:
    print('Please use numbers, not words!')
