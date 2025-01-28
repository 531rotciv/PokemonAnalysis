	drop table if exists average_pokemon_stats;
	create temp table average_pokemon_stats as
	select
	  tier,
	  avg(total) as avg_total,
	  avg(hp) as avg_hp,
	  avg(attack) as avg_atk,
	  avg(defense) as avg_def,
	  avg(sp_atk) as avg_sp_atk,
	  avg(sp_def) as avg_sp_def,
	  avg(speed) as avg_speed
	from
	  pokemon_stat_table as pst
	  join pokemon_evolution_table as pet on pst.name = pet.name
	  join smogon_tiers as st on pst.name = st.name
	group by
	  tier;
