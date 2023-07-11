# Витрина RFM

## 1.1. Выясните требования к целевой витрине.

{См. задание на платформе}

    Требования:
        1)Витрина должна располагаться в той же базе в схеме analysi
        2)Витрина должна состоять из таких полей:
            user_id
            recency (число от 1 до 5)
            frequency (число от 1 до 5)
            monetary_value (число от 1 до 5
        3)В витрине нужны данные с начала 2022 года.
        1) Название витрины "dm_rfm_segments"
        2) Обновления для витрины не нужны.

-----------

{Впишите сюда ваш ответ}


## 1.2. Изучите структуру исходных данных.



Схема production состоит из 6 таблиц: orderitems, orders, orderstatuses,orderstatuslog,products, users

Таблица orderitems:
    id int4
    product_id int4
    order_id int4
    name varchar(2048)
    quantity int4
    price numeric(19, 5)
    discount numeric(19, 5)

Таблица orders:
    order_id int4
    order_ts timestamp
    user_id int4
    bonus_payment numeric(19, 5)
    payment numeric(19, 5)
    cost numeric(19, 5)
    bonus_grant numeric(19, 5)
    status int4

Таблица orderstatuses:
    id int4
    key varchar(255)

Таблица orderstatuslog:
    id int4
    order_id int4
    status_id int4
    dttm timestamp

Таблица products:
    id int4
    name varchar(2048)
    price numeric(19, 5)

Таблица users:
    id int4
    name varchar(2048)
    login varchar(2048)



## 1.3. Проанализируйте качество данных

{См. задание на платформе}


{Впишите сюда ваш ответ}


## 1.4. Подготовьте витрину данных

{См. задание на платформе}
### 1.4.1. Сделайте VIEW для таблиц из базы production.**

{См. задание на платформе}
```SQL
--Впишите сюда ваш ответ


```

### 1.4.2. Напишите DDL-запрос для создания витрины.**

{См. задание на платформе}
```SQL
--Впишите сюда ваш ответ


```

### 1.4.3. Напишите SQL запрос для заполнения витрины

{См. задание на платформе}
```SQL
--Впишите сюда ваш ответ


```



