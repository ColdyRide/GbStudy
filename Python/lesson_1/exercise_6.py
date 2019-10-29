# Lesson 1 - Exercise number 6
# Спортсмен занимается ежедневными пробежками. В первый день его результат составил А километров.
# Каждый день спортсмен увеличивал результат на 10 % относительно предыдущего. Требуется определить номер дня,
# на который результат спортсмена составит не менее B километров.
# Программа должна принимать значения параметров A и b и выводить одно натуральное число — номер дня.
first_run = float(input('Please, insert running distance at first day - '))
expected_run = float(input('Please, insert the desired running distance - '))
day = 1
while first_run <= expected_run:
    first_run += first_run * 0.1
    day += 1
print(f'A result of at least {expected_run} km will be achieved on day {day}')
