
--Некоторые запросы для анализа данных
select * from public.supermarket_sales order by "Invoice ID"  ;
select distinct "Product line" from supermarket_sales ;
select distinct "Customer type" from supermarket_sales ;
select distinct payment from public.supermarket_sales ;
select distinct branch  from public.supermarket_sales ;
select distinct gender  from public.supermarket_sales ;

-- Запросы проверки таблиц
select * from public.dim_payment dp  ;
select * from public.dim_product_line ;
select * from public.dim_city ;
select * from public.dim_branch  ;
select * from public.dim_customer_type;
select * from dim_gender dg ;
select * from nds_supermarket_sales nss ;
select * from public."CSV reading errors" cre ;