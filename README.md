# demo_voltmobi
Это тестовое задание на позицию RoR разработчика в компанию voltmobi.

# Реализовать Task Manager.

##### 1. Необходимо создать:
* модель Task (name, description, state)
* модель User (email, password)

Отношение User->Task - one-to-many.\
Task имеет 3 состояния - new, started, finished (реализовать паттерн State machine).

##### 2. Сделать страницу приветствия приложения
Welcome-страница, на которой выводится список всех задач в приложении с указанием кому принадлежит задача.

##### 3. Сделать страницу авторизации пользователя в личный кабинет.

##### 4. Подготовить seeds с данными пользователей для входа в личный кабинет.

##### 5. В личном кабинете реализовать CRUD задач пользователя (через REST API). Сделать возможность прикрепления файлов к задаче.

##### 6. Реализовать смену состояния (state) задачи.
\
\
При реализации использовать Rails, Twitter Bootstrap 3 для вёрстки. Код на github. Задачи реализовывать отдельными коммитами. TDD, прикрутить travis ci. Приложение выложить на Heroku.

