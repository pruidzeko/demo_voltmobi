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

  Сценарий: Невозможно создать задачу без названия, описания
    Допустим я пользователь "user@example.com"
      И я на странице Список задач
    Если я кликаю ссылку на страницу Новая задача
      И я кликаю ссылку "Выбрать"
      И я кликаю кнопку "Сохранить"
    То я должен увидеть сообщение "Название не может быть пустым"
      И я должен увидеть сообщение "Описание не может быть пустым"

  Сценарий: Пользователь создает новую задачу. По умолчанию задача имеет статус "Новая"
    Допустим я пользователь "user@example.com"
      И существует пользователь "executor@example.com"
      И я на странице Список задач
    Если я кликаю ссылку "Новая задача"
      И я оказался на странице Выбор исполнителя
      И кликаю по последней ссылке "Выбрать"
      И я должен увидеть текст "executor@example.com"
      И ввожу следующие значения:
        | Название    | Добавить state_machine |
        | Описание    | Система переходов по состояниям |
      И я кликаю кнопку "Сохранить"
    То должна существовать задача "Добавить state_machine" с:
      | Описание  | Система переходов по состояниям |
      | Состояние | new                             |
      И исполнителем задачи "Добавить state_machine" должен быть "executor@example.com"
      
@javascript
  Сценарий: Пользователь создает новую задачу. По умолчанию задача имеет статус "Новая"
    Допустим я пользователь "user@example.com"
      И существует пользователь "executor@example.com"
      И я на странице Список задач
    Если я кликаю ссылку "Новая задача"
      #И я оказался на странице Новая задача
      # Открываем список пользователей
      И я кликаю ссылку "Выбрать" 
      И подождал 2 сек.
      И кликаю по последней ссылке "Выбрать"
      И я должен увидеть текст "executor@example.com"
      И ввожу следующие значения:
        | Название    | Добавить state_machine |
        | Описание    | Система переходов по состояниям |
      И я кликаю кнопку "Сохранить"
    То должна существовать задача "Добавить state_machine" с:
      | Описание  | Система переходов по состояниям |
      | Состояние | new                             |
      И исполнителем задачи "Добавить state_machine" должен быть "executor@example.com"
      
  Сценарий: К задаче можно прикреплять файлы
    Допустим я пользователь "user@example.com"
      И я на странице Список задач
    Если я кликаю ссылку на страницу Новая задача
      И я кликаю ссылку "Выбрать"
      И ввожу следующие значения:
        | Название    | Добавить state_machine |
        | Описание    | Система переходов по состояниям |
      И я выбираю файл "app/assets/images/rails.png" в поле "attachments[][stuff]"
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


  Сценарий: Исполнитель не видит элементов для удаления и редактирования задачи, если он не ее автор 
    Допустим я пользователь "executor@example.com"
      И существует пользователь "author@example.com"
      И существует задача от "author@example.com" для "executor@example.com" с:
      | name       | Написать тесты |
      | description | Покрыть тестами все |
    Если я на странице задачи "Написать тесты"
    То на странице не должно быть ссылки "Удалить"
      И на странице не должно быть ссылки на страницу редактирование задачи "Написать тесты"

  Сценарий: Исполнитель не может редактировать задачу, если он не ее автор 
    Допустим я пользователь "executor@example.com"
      И существует пользователь "author@example.com"
      И существует задача от "author@example.com" для "executor@example.com" с:
      | name       | Написать тесты |
      | description | Покрыть тестами все |
    Если я перехожу на страницу редактирование задачи "Написать тесты"
    То я должен увидеть сообщение "Нет привелегий для выполнения данного действия"


  Сценарий: Автор задачи не может изменять ее статус, если он не является испонителем
    Допустим я пользователь "author@example.com"
      И существует пользователь "executor@example.com"
      И существует задача от "author@example.com" для "executor@example.com" с:
      | name       | Написать тесты |
      | description | Покрыть тестами все |
    Если я на странице задачи "Написать тесты"
    То на странице не должно быть ссылки "Начать"




