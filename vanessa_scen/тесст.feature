﻿#language: ru

@tree

Функционал: Создание Поступления товаров

Как Менеджер по закупкам я хочу
Создание документа Поступление товаров и услуг 
для постановки товаров на учет
Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: создание поступления товаров 
//создание Поступления товаров
* Открытие формы Поступления товаров
	И В командном интерфейсе я выбираю 'Закупки' 'Поступления товаров'
	Тогда открылось окно 'Поступления товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Поступление товара (создание)'
* Заполнение шапки документа Поступления товаров
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Товары"'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Большой'
	Тогда элемент формы с именем "Склад" стал равен 'Большой'
		
	И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
	И я нажимаю кнопку выбора у поля с именем "Поставщик"
	Тогда открылось окно 'Контрагенты'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Поступление товара (создание) *'
* Заполнение ТЧ Товаров
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю точное значение 'Хлеб'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '1 500,00'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" я завершаю редактирование строки
* Проверка заполнения ТЧ
	Тогда таблица "Товары" содержит строки:
		| 'Товар' | 'Цена'  | 'Артикул' | 'Количество' | 'Сумма'     |
		| 'Хлеб'  | '15,00' | 'H987'    | '1 500,00'   | '22 500,00' |
	И  я нажимаю на кнопку "Записать"
* Номер документа
	И я запоминаю значение поля "Номер" как "$Номер$"
* Запись и проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Поступление товара (создание) *' в течение 20 секунд
* Проверка создания документа
	И таблица  "Список" содержит строки:
		| 'Номер' |
		| '$Номер$'   |

Сценарий: Проверка наличия в справочнике нмоенклатуры Хлеб
	И В командном интерфейсе я выбираю 'Товарные запасы' 'Товары'
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И таблица  "Список" содержит строки:
		| 'Наименование' |
		| 'Хлеб'   |