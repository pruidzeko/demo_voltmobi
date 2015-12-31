# encoding: utf-8
# language: ru
Функционал: Пользователь может обновлять данные своей учетной записи

  Сценарий: Пользователь изменят свой пароль
    Допустим я пользователь с:
      | email    | admin@example.com |
      | password | oldpassword    |
    Если я кликаю ссылку на страницу Профиль
      Если я кликаю ссылку "Редактировать"
      И я ввожу следующие значения:
        | Новый пароль                | newpassword |
        | Подтверждение нового пароля | newpassword |
        | Текущий пароль              | oldpassword |
      И кликаю кнопку "Сохранить"
    То пользователь "admin@example.com" сможет войти на сайт с паролем "newpassword"

  Сценарий: Пользователь пытается изменить свой пароль без указания старого
    Допустим я пользователь с:
      | email    | admin@example.com |
      | password | oldpassword    |
    Если я кликаю ссылку на страницу Профиль
      Если я кликаю ссылку "Редактировать"
      И я ввожу следующие значения:
        | Новый пароль                | newpassword |
        | Подтверждение нового пароля | newpassword |
      И кликаю кнопку "Сохранить"
    То я должен увидеть сообщение "Текущий пароль не может быть пустым"
      И пользователь "admin@example.com" не сможет войти на сайт с паролем "newpassword"
      И пользователь "admin@example.com" сможет войти на сайт с паролем "oldpassword"


  Сценарий: Пользователь может редактировать собственный профиль
    Допустим я пользователь с:
      | email    | admin@example.com |
      | password | oldpassword    |
    Если я кликаю ссылку на страницу Профиль
      Если я кликаю ссылку "Редактировать"
      И я ввожу следующие значения:
        | Имя            | Валентин    |
        | Текущий пароль | oldpassword |
      И я ввожу в поле "user[name]" значение "Валентин"
      И выбираю дату "1915-01-01" в поле "Дата рождения"
      И сохранить страницу
      И кликаю кнопку "Сохранить"
      И я на странице Профиль
    То пользователь "admin@example.com" должен иметь следующие данные
        | Имя           | Валентин   |
        | Дата рождения | 1915-01-01 |

  Сценарий: Пользователь может удалить свой аккаунт
    Допустим я пользователь "admin@example.com"
    Если я кликаю ссылку на страницу Профиль
      И кликаю ссылку "Удалить"
    То пользователь "admin@example.com" не должен быть залогинен
      И я должен оказаться на странице Главная
      А пользователя "admin@example.com" не должно существовать


  Сценарий: Пользователь восстанавливает забытый пароль
    Допустим существует пользователь "admin@example.com"
      И я на Главной странице сайта
    Если я кликаю ссылку "Забыли пароль?"
      И ввожу "admin@example.com" в поле "Email"
      И кликаю кнопку "Изменить пароль"
      И на почту "admin@example.com" должно быть отправлено сообщение "Инструкции по восстановлению пароля"
      И я перехожу по ссылке из сообщения "Изменить пароль"
      И я ввожу следующие значения:
        | Новый пароль                | newpassword |
        | Подтверждение нового пароля | newpassword |
      И кликаю кнопку "Изменить пароль"
    То я должен увидеть сообщение "пароль успешно изменён"
      То пользователь "admin@example.com" сможет войти на сайт с паролем "newpassword"
      
  Сценарий: Каждый пользователь может иметь аватарку
    Допустим я пользователь с:
      | email    | admin@example.com |
      | password | oldpassword    |
    Если я кликаю ссылку на страницу Профиль
      И кликаю ссылку "Редактировать"
      И выбираю файл "app/assets/images/avatar.jpg" в поле "Аватар"
      И ввожу "oldpassword" в поле "Текущий пароль"
      И сохранить страницу
      И кликаю кнопку "Сохранить"
    То пользователь "admin@example.com" должен иметь аватарку "avatar.jpg"

