drop table if exists nds_supermarket_sales cascade;
drop table if exists dim_payment cascade;
drop table if exists dim_city cascade;
drop table if exists dim_branch cascade;
drop table if exists dim_customer_type cascade;
drop table if exists dim_gender cascade;
drop table if exists dim_product_line cascade;
drop table if exists "CSV reading errors";


--Создание таблиц измерений
create table dim_payment (
payment_sk int generated always as identity unique,
Payment varchar (50) unique
);
create table dim_city 	 (
city_sk int generated always as identity unique,
City varchar (50) unique
);
create table dim_branch (
branch_sk int generated always as identity unique,
Branch varchar (50) unique
--check (Branch ~ '^[a-zA-Z]')
);
create table dim_customer_type (
customer_sk int generated always as identity unique,
"Customer type" varchar (50) unique
);
create table dim_gender (
gender_sk int generated always as identity unique,
Gender varchar (50) unique
);
create table dim_product_line (
product_line_sk int generated always as identity unique,
"Product line" varchar (50) unique
);
CREATE TABLE "public"."CSV reading errors"
(
  "Errors from CSV readings Dim tables" TEXT,
  "Errors from CSV readings Facts tables" TEXT,
  "Errors in Dates" TEXT,
  "Errors in output Facts table" TEXT,
  "Errors Dim_branch output" TEXT,
  "Errors Dim_payment output" TEXT,
  "Errors Dim_city output" TEXT,
  "Errors Dim_customer_type output" TEXT,
  "Errors Dim_gender output" TEXT,
  "Errors Dim_product_line output" TEXT
)
;

--Создание таблицы фактов
create table nds_supermarket_sales (
payment_sk int not null references dim_payment (payment_sk),
city_sk int not null references dim_city (city_sk),
branch_sk int not null references dim_branch (branch_sk),
customer_sk int not null references dim_customer_type (customer_sk),
gender_sk int not null references dim_gender (gender_sk),
product_line_sk int not null references dim_product_line (product_line_sk),
invoice_id varchar(20) primary key,
unit_price varchar(20) not null ,
quantity int not null ,
"tax 5%" varchar(20) not null ,
total varchar(20) not null ,
"date" date not null,
check ("date"<now()::date) ,
"time" varchar(20) not null,
cogs varchar(20) not null ,
gross_margin varchar(20) not null ,
gross_income varchar(20) not null ,
rating varchar(20) not null
);