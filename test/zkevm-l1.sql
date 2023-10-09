\pset pager 0
\dt
\dt public.*
-- select * from public.users order by block_num desc limit 5;
-- select * from public.addresses;
select value from public.address_coin_balances where value > 1 order by value desc;