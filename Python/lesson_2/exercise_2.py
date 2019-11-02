# Lesson 2 Exercise 2
# Для списка реализовать обмен значений соседних элементов, т.е.
# Значениями обмениваются элементы с индексами 0 и 1, 2 и 3 и т.д.
# При нечетном количестве элементов последний сохранить на своем месте.
# Для заполнения списка элементов необходимо использовать функцию input().
init_list = input('Please, insert our list, each element separate by space - ')
init_list = init_list.split(' ')
for i in range(0,len(init_list)-len(init_list)%2,2):
    init_list[i], init_list[i+1] = init_list[i+1], init_list[i]
print(f'Our result list is - {init_list}')
