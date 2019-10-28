# Lesson 1 - Exercise number 5
# Запросите у пользователя значения выручки и издержек фирмы.
# Определите, с каким финансовым результатом работает фирма (прибыль — выручка больше издержек,
# или убыток — издержки больше выручки). Выведите соответствующее сообщение.
# Если фирма отработала с прибылью, вычислите рентабельность выручки (соотношение прибыли к выручке).
# Далее запросите численность сотрудников фирмы и определите прибыль фирмы в расчете на одного сотрудника.
revenue = float(input('Please, insert your revenue value - '))
costs = float(input('Please, insert your costs value - '))
income = revenue - costs
if revenue > costs:
    print(f'Company finished period with income - {income} $ and return of revenue - {income / revenue:.2%} ')
    employees_num = int(input('Please, insert number of employees - '))
    print(f'Profit per employee - {int(income / employees_num)}')
else:
    print(f'Company finished period with loss of {income} $')
