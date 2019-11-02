# Lesson 2 Exercise 4
# Пользователь вводит строку из нескольких слов, разделённых пробелами.
# Вывести каждое слово с новой строки.
# Строки необходимо пронумеровать. Если в слово длинное, выводить только первые 10 букв в слове.
init_list = input('Please, insert your text, each element separate by space - ')
# Cleaning from empty strings
init_list = [i for i in init_list.split(' ') if i]
for i, j in enumerate(init_list, 1):
    print(i, j[:10])
