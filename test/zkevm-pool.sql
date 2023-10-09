\pset pager 0';
select * from pool.gas_price order by item_id desc limit 5;
select * from pool.blocked order by addr desc limit 5;
select * from pool.transaction order by received_at desc limit 5;