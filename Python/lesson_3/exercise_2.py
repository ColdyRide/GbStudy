# Lesson 3 Exercise 2
# Реализовать функцию, принимающую несколько параметров, описывающих данные пользователя:
# имя, фамилия, год рождения, город проживания, email, телефон.
# Функция должна принимать параметры как именованные аргументы. Реализовать вывод данных о пользователе одной строкой.


def user_data(**kwargs):
    return print(f"User {kwargs['name']} {kwargs['lastname']} is {kwargs['year']} year of birth live in "
                 f"{kwargs['town']} have follow personal data: email - {kwargs['mail']}, tel. - {kwargs['tel']}")


user_data(name=input("Please insert user's name - "), lastname=input("Please insert user's lastname - "),
          year=input("Please insert user's date of birth - "), town=input("Please insert user's live place - "),
          mail=input("Please insert user's email address - "), tel=input("Please insert user's phone number - "))
