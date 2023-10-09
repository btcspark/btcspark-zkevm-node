\pset pager 0
select * from state.fork_id order by block_num desc limit 5;
select * from state.trusted_reorg order by timestamp desc limit 5;
select * from state.sync_info limit 5;

select * from state.log order by address desc limit 5;
select * from state.transaction order by l2_block_num desc limit 5;
select * from state.receipt order by block_num desc limit 5;
select * from state.l2block order by block_num desc limit 5;
select * from state.virtual_batch order by block_num desc limit 5;
select * from state.batch order by batch_num desc limit 5;
select * from state.proof order by batch_num desc limit 5;
select * from state.forced_batch order by timestamp desc limit 5;
select * from state.sequences order by from_batch_num desc limit 5;
select * from state.block order by block_num desc limit 5;
select * from state.verified_batch order by block_num desc limit 5;
select * from state.exit_root order by id desc limit 5;

select * from state.monitored_txs order by id desc limit 5;
 