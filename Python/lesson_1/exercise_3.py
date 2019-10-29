# Lesson 1 - Exercise number 3
# Узнайте у пользователя число n. Найдите сумму чисел n + nn + nnn.
# Например, пользователь ввёл число 3. Считаем 3 + 33 + 333 = 369.
number = input('Please, insert number N - ')
print('N+NN+NNN = %d' % (int(number) + int(2 * number) + int(3 * number)))
