# Lesson 2 Exercise 6
# Реализовать структуру данных «Товары». Она должна представлять собой список кортежей.
# Каждый кортеж хранит информацию об отдельном товаре.
# В кортеже должно быть два элемента — номер товара и
# словарь с параметрами (характеристиками товара: название, цена, количество, единица измерения).
# Структуру нужно сформировать программно, т.е. запрашивать все данные у пользователя.
# Необходимо собрать аналитику о товарах.
# Реализовать словарь, в котором каждый ключ — характеристика товара, например название,
# а значение — список значений-характеристик, например список названий товаров.
INVITE = 'Actions:\nPress Enter - Exit\n1 - Add goods\n2 - Print analyse\nPlease, select your action:\n'
menu = input(INVITE)
KEYS = ['название', 'цена', 'количество', 'ед']
structure = []
while menu:
    try:
        menu = int(menu)
        if menu not in range(1, 3):
            raise ValueError
        elif menu == 1:
            add_raw = input('Please, insert name, price, amount and units of your good. '
                            'For separation please use space:\n')
            add_raw = [i for i in add_raw.split(' ') if i]
            if add_raw:
                goods = dict(zip(KEYS, add_raw))
                structure.append((len(structure) + 1, goods))
            else:
                print('Please fill in all parameters. Empty string will not added')
        elif menu == 2:
            add_raw = input('Please insert what analyse you want. For example '
                            'for only names and prices of goods type Название Цена.\nInsert here:\n')
            add_raw = [i for i in add_raw.split(' ') if i]
            if structure:
                analyse = {}
                for i in add_raw:
                    if i.lower() in KEYS:
                        raw_data = []
                        for j in structure:
                            raw_data.append(j[1].get(i.lower()))
                        analyse.update({i: raw_data})
                    else:
                        print(f'{i} - not exist property\n')
                    if analyse:
                        for keys, items in analyse.items():
                            print(f'{keys} : {items}')
        menu = input(INVITE)
    except ValueError:
        print('Not valid command!')
        menu = input(INVITE)
        continue
print('Bye')
