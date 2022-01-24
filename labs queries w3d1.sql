show databases;
show full tables;
select * from bank.account;
select distinct (frequency) from account;
select date from account;
select account_id from account
where frequency=('POPLATEK TYDNE');
select *from bank.client order by birth_number;
select * from bank.order order by amount>14750 desc limit 5;

-- Get the id values of the first 5 clients from district_id with a value equals to 1.
select client_id from Client where district_id=1 limit 5;

-- In the client table, get an id value of the last client where the district_id equals to 72.
select client_id from Client where district_id=72;

-- Get the 3 lowest amounts in the loan table.
select amount from loan order by amount limit 3;

-- What are the possible values for status, ordered alphabetically in ascending order in the loan table?
select distinct status from bank.loan;

-- What is the loan_id of the highest payment received in the loan table?
select loan_id, payments from bank.loan
order by payments desc
limit 1;

-- What is the loan amount of the lowest 5 account_ids in the loan table? Show the account_id and the corresponding amount
select account_id, amount from bank.loan
order by account_id
limit 5;

-- What are the account_ids with the lowest loan amount that have a loan duration of 60 in the loan table?
select account_id, amount, duration from bank.loan
where duration=60
order by amount limit 5;

-- What are the unique values of k_symbol in the order table?
select distinct k_symbol from bank.order;

-- In the order table, what are the order_ids of the client with the account_id 34?
select order_id from bank.order
where account_id=34;

-- In the order table, which account_ids were responsible for orders between order_id 29540 and order_id 29560 (inclusive)?
select distinct(account_id) order_id from bank.order
where order_id>=29540 and order_id<=29560;

-- In the order table, what are the individual amounts that were sent to (account_to) id 30067122?
select amount, account_to from bank.order
where account_to=30067122;

/* In the trans table, show the trans_id, date, type and amount of the 10 first transactions from account_id 793 in chronological order,
from newest to oldest.
*/
select trans_id, date, type, amount from bank.trans
where account_id=793
order by date desc
limit 10;

-- OPTIONAL--
/* In the client table, of all districts with a district_id lower than 10, how many clients are from each district_id?
Show the results sorted by the district_id in ascending order.
*/
select client_id, district_id from bank.client
where district_id<10
order by distinct client_id
count client_id by district_id


