DROP DATABASE IF EXISTS budget_project_db;
CREATE DATABASE budget_project_db;

USE budget_project_db;

DROP TABLE IF EXISTS users;

create table users(
    user_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_name varchar(50) not null,
    password varchar(50) not null,
    primary key(user_id)
);

Drop table if exists budgets

create table budgets(
    budget_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id int UNSIGNED not null,
    budget_name varchar(50),
    foreign key(user_id) references users (user_id),
    primary key(budget_id)
);

DROP table if EXISTS income;

create table income(
  income_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  income_name varchar(50) not null,
  income_freq varchar(50),
  primary key (income_id)
);

DROP table if EXISTS expense;

create table expense(
  expense_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  expense_name varchar(50) not null,
  primary key (expense_id)
);

DROP table if EXISTS budget_income;

create table budget_income(
  user_income_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  income_amount int unsigned not null,
  budget_id int unsigned not null,
  income_id int unsigned not null,
  foreign key(budget_id) references budgets (budget_id),
  foreign key(income_id) references income (income_id),
  primary key (user_income_id)
);

DROP table if EXISTS budget_expense;

create table budget_expense(
  user_expense_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  expense_amount int unsigned not null,
  budget_id int unsigned not null,
  expense_id int unsigned not null,
  foreign key(budget_id) references budgets (budget_id),
  foreign key(expense_id) references expense (expense_id),
  primary key (user_expense_id)
);