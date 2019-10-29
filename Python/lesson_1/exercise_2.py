# Lesson 1 - Exercise number 2
# Пользователь вводит время в секундах.
# Переведите время в часы, минуты и секунды и выведите в формате чч:мм:сс. Используйте форматирование строк.
raw_seconds = int(input('Please, insert time in seconds, only positive values applicable - '))
print('%d:%d:%d' % (raw_seconds // 3600, raw_seconds % 3600 // 60, raw_seconds % 60))
