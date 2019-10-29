# Lesson 1 - Exercise number 1
# Поработайте с переменными, создайте несколько, выведите на экран,
# запросите у пользователя несколько чисел и строк и сохраните в переменные, выведите на экран.
print('Welcome to the user creation wizard!')
name = input('What\'s your name?\n')
print('Nice to meet you, %s' % name)
age = int(input('How old are you ?\n'))
print('Account was created with following parameters:\nUser %5s\nAge %5s' % (name, age))
