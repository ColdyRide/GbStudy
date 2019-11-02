# Lesson 2 Exercise 4
# Реализовать структуру «Рейтинг», представляющую собой не возрастающий набор натуральных чисел.
# У пользователя необходимо запрашивать новый элемент рейтинга.
# Если в рейтинге существуют элементы с одинаковыми значениями,
# то новый элемент с тем же значением должен разместиться после них.
user_raw = input('Please insert integer natural number, if you wanna exit just press Enter - ')
rating = []
while user_raw != '':
    try:
        user_raw = int(user_raw)
        if user_raw >= 0:
            if not rating:
                rating.append(user_raw)
            elif user_raw > rating[0]:
                rating.insert(0, user_raw)
            elif rating.count(user_raw):
                rating.insert(rating.index(user_raw) + rating.count(user_raw), user_raw)
            else:
                next_ind = 0
                for i in rating:
                    if i > user_raw:
                        next_ind = rating.index(i) + rating.count(i)
                rating.insert(next_ind, user_raw)
            user_raw = input('Please insert integer natural number, if you wanna exit just press Enter - ')
        else:
            raise ValueError
    except ValueError:
        print('Input wasn\'t correct! Only positive integer numbers will accepted!')
        user_raw = input('Please insert integer natural number, if you wanna exit just press Enter - ')
if rating:
    print(f'Your rating structure - {rating}')
print('Bye')
