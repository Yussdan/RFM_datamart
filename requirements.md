
Recency:
    Для recency используем три таблицы из схемы production: orders,user и orderstatuses.

    В таблице production.orders используем user_id, order_ts и status.
    В таблице production.orderstatuses смотрим какой статус у заказа с помощью id и key
    С помощью таблицы user будем смотреть пользователей которые ничего не заказыввали

Frequency:
    Для frequency используем две таблицы из схемы production: orders,user и orderstatuses.

    В таблице production.orders используем user_id, status.
    В таблице production.orderstatuses смотрим какой статус у заказа с помощью id и key
    С помощью таблицы user будем смотреть пользователей которые ничего не заказыввали

Monetary ValueMonetary Value:
    Для Monetary Value используем две таблицы из схемы production: orders,user и orderstatuses.
    production.orders поможет посчитать количество денег потраченных каждым пользавателем.
    В таблице production.orderstatuses смотрим какой статус у заказа с помощью id и key
    С помощью таблицы user будем смотреть пользователей которые ничего не заказыввали


