# Lesson 4 exercise 3
# Для чисел в пределах от 20 до 240 найти числа, кратные 20 или 21. Необходимо решить задание в одну строку.

[print(i, end=' ') for i in range(20, 241) if not i % 20 or not i % 21]
