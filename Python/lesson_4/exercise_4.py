# Lesson 4 exercise 4
# Представлен список чисел. Определить элементы списка, не имеющие повторений.
# Сформировать итоговый массив чисел, соответствующих требованию.
# Элементы вывести в порядке их следования в исходном списке. Для выполнения задания обязательно использовать генератор.

raw_input = input('Please insert list of numbers, separated by space - ').split()
try:
    [print(float(i), end=' ') for i in raw_input if raw_input.count(i) == 1]
except ValueError:
    print('Please use numbers, not words!')
