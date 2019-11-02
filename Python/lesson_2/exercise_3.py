# Lesson 2 Exercise 3
# Пользователь вводит месяц в виде целого числа от 1 до 12.
# Сообщить к какому времени года относится месяц (зима, весна, лето, осень). Напишите решения через list и через dict.

# List solution
print('This solution used list')
seasons = ['зима', 'зима', 'весна', 'весна', 'весна', 'лето', 'лето', 'лето', 'осень', 'осень', 'осень', 'зима']
while True:
    try:
        user_number = int(input('Please, insert month number from 1 to 12 - '))
        if user_number not in range(1, 13):
            raise ValueError
        print(f'For month number {user_number} season in Russian named - {seasons[user_number - 1]}\n')
        break
    except ValueError:
        print('Input wasn\'t correct! Only numbers from 1 to 12 will accepted!')

# Dict solution
print('This solution used dict')
seasons = {'зима': [12, 1, 2], 'весна': [3, 4, 5], 'лето': [6, 7, 8], 'осень': [9, 10, 11]}
while True:
    try:
        user_number = int(input('Please, insert month number from 1 to 12 - '))
        if user_number not in range(1, 13):
            raise ValueError
        for i in seasons.keys():
            if user_number in seasons.get(i):
                print(f'For month number {user_number} season in Russian named - {i}')
        break
    except ValueError:
        print('Input wasn\'t correct! Only numbers from 1 to 12 will accepted!')
