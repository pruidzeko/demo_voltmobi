# encoding: urf-8
# language: ru
#
Функционал: Менеджер задач
  Каждый пользователь может управлять задачами, изменять из состояние. На главной странице отображается список задач.

  Сценарий: Любой посетитель может заходя на главную страницу видит список задач, с указанием кому принадлежит задача.
    Допустим существует пользователь "user@site.com"
      И существует задача для "user@site.com" с:
      | name       | Написать тесты |
      | description | Покрыть тестами все |
    Если я перехожу на страницу Главная
    То я должен увидеть текст "Написать тесты" 
      И должен увидеть текст "user@site.com"

  Сценарий: Не зарегистрированный пользователь не видит элементы управления задачами
    Допустим существует пользователь "user@site.com"
      И существует задача для "user@site.com" с:
      | name       | Написать тесты |
      | description | Покрыть тестами все |
    Если я перехожу на страницу Главная
    То на странице не должно быть ссылки на страницу Новая задача
      И на странице не должно быть текста "Редактировать"
      И на странице не должно быть текста "Удалить"

  Сценарий: Не зарегистрированный пользователь не может добавить новую задачу
    Если я перехожу на страницу Новая задача
    То я должен увидеть сообщение "Нет привелегий для выполнения данного действия"

  Сценарий: Невозможно создать задачу без названия и описания
    Допустим я пользователь "user@example.com"
      И я на странице Список задач
    Если я кликаю ссылку на страницу Новая задача
      И я кликаю кнопку "Сохранить"
    То я должен увидеть сообщение "Название не может быть пустым"
      И я должен увидеть сообщение "Описание не может быть пустым"

  Сценарий: Пользователь создает новую задачу. По умолчанию задача имеет статус "Новая"
    Допустим я пользователь "user@example.com"
      И я на странице Список задач
    Если я кликаю ссылку на страницу Новая задача
      И ввожу следующие значения:
        | Название    | Добавить state_machine |
        | Описание    | Система переходов по состояниям |
      И я кликаю кнопку "Сохранить"
    То должна существовать задача "Добавить state_machine" с:
      | Описание  | Система переходов по состояниям |
      | Состояние | new                             |
      
  Сценарий: К задаче можно прикреплять файлы
    Допустим я пользователь "user@example.com"
      И я на странице Список задач
    Если я кликаю ссылку на страницу Новая задача
      И ввожу следующие значения:
        | Название    | Добавить state_machine |
        | Описание    | Система переходов по состояниям |
      И я выбираю файл "rails.png" в поле "attachments[][stuff]"
      И я кликаю кнопку "Сохранить"
    То должна существовать задача "Добавить state_machine" с:
      | Описание  | Система переходов по состояниям |
      | Состояние | new                             |
      И к задаче должен быть прикреплен файл "rails.png"


  Сценарий: Пользователь начинает выполнение задачи, изменяя ее статус
    Допустим я пользователь "user@site.com"
      И существует задача для "user@site.com" с:
      | name       | Написать тесты |
      | description | Покрыть тестами все |
    Если я перехожу на страницу Список задач
      И на странице не должно быть текста "Готово"
      И я кликаю ссылку "Начать"
    То у задачи "Написать тесты" должны быть аттрибуты:
      | Состояние | started |


  Сценарий: Пользователь завершает задачу, изменяя ее статус.
    Допустим я пользователь "user@site.com"
      И существует задача для "user@site.com" с:
      | name       | Написать тесты |
      | description | Покрыть тестами все |
    Если я перехожу на страницу Список задач
      И на странице не должно быть текста "Готово"
      И я кликаю ссылку "Начать"
      И на странице не должно быть текста "Начать"
      И я кликаю ссылку "Готово!"
    То у задачи "Написать тесты" должны быть аттрибуты:
      | Состояние | finished |



