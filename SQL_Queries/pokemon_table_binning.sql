drop table if exists pokemon_table_for_ml;
create table pokemon_table_for_ml as 
	select
	  pctt.name,
	  pctt.primary_type,
	  pctt.secondary_type,
	  te.row_id as type_effectiveness_id,
	  al.row_id as ability_id1,
	  al2.row_id as abilitiy_id2,
	  al3.row_id as ability_id3,
	  case
	    when total > 150
	    and total < 200 then 0
	    when total >= 200
	    and total < 250 then 1
	    when total >= 250
	    and total < 300 then 2
	    when total >= 300
	    and total < 350 then 3
	    when total >= 350
	    and total < 400 then 4
	    when total >= 400
	    and total < 450 then 5
	    when total >= 450
	    and total < 500 then 6
	    when total >= 500
	    and total < 550 then 7
	    when total >= 550
	    and total < 600 then 8
	    when total >= 600
	    and total < 650 then 9
	    when total >= 650
	    and total < 700 then 10
	    when total >= 700 then 11
	    else -1
	  end as total_bin,
	  case
	    when hp < 20 then 0
	    when hp >= 20
	    and hp < 40 then 1
	    when hp >= 40
	    and hp < 60 then 2
	    when hp >= 60
	    and hp < 80 then 3
	    when hp >= 80
	    and hp < 100 then 4
	    when hp >= 100
	    and hp < 120 then 5
	    when hp >= 120
	    and hp < 140 then 6
	    when hp >= 140
	    and hp < 160 then 7
	    when hp >= 160
	    and hp < 180 then 8
	    when hp >= 180
	    and hp < 200 then 9
	    else 10
	  end as hp_bin,
	  case
	    when attack < 20 then 0
	    when attack >= 20
	    and attack < 40 then 1
	    when attack >= 40
	    and attack < 60 then 2
	    when attack >= 60
	    and attack < 80 then 3
	    when attack >= 80
	    and attack < 100 then 4
	    when attack >= 100
	    and attack < 120 then 5
	    when attack >= 120
	    and attack < 140 then 6
	    when attack >= 140
	    and attack < 160 then 7
	    when attack >= 160
	    and attack < 180 then 8
	    when attack >= 180
	    and attack < 200 then 9
	    else 10
	  end as attack_bin,
	  case
	    when defense < 20 then 0
	    when defense >= 20
	    and defense < 40 then 1
	    when defense >= 40
	    and defense < 60 then 2
	    when defense >= 60
	    and defense < 80 then 3
	    when defense >= 80
	    and defense < 100 then 4
	    when defense >= 100
	    and defense < 120 then 5
	    when defense >= 120
	    and defense < 140 then 6
	    when defense >= 140
	    and defense < 160 then 7
	    when defense >= 160
	    and defense < 180 then 8
	    when defense >= 180
	    and defense < 200 then 9
	    else 10
	  end as defense_bin,
	  case
	    when sp_atk < 20 then 0
	    when sp_atk >= 20
	    and sp_atk < 40 then 1
	    when sp_atk >= 40
	    and sp_atk < 60 then 2
	    when sp_atk >= 60
	    and sp_atk < 80 then 3
	    when sp_atk >= 80
	    and sp_atk < 100 then 4
	    when sp_atk >= 100
	    and sp_atk < 120 then 5
	    when sp_atk >= 120
	    and sp_atk < 140 then 6
	    when sp_atk >= 140
	    and sp_atk < 160 then 7
	    when sp_atk >= 160
	    and sp_atk < 180 then 8
	    when sp_atk >= 180
	    and sp_atk < 200 then 9
	    else 10
	  end as sp_atk_bin,
	  case
	    when sp_def < 20 then 0
	    when sp_def >= 20
	    and sp_def < 40 then 1
	    when sp_def >= 40
	    and sp_def < 60 then 2
	    when sp_def >= 60
	    and sp_def < 80 then 3
	    when sp_def >= 80
	    and sp_def < 100 then 4
	    when sp_def >= 100
	    and sp_def < 120 then 5
	    when sp_def >= 120
	    and sp_def < 140 then 6
	    when sp_def >= 140
	    and sp_def < 160 then 7
	    when sp_def >= 160
	    and sp_def < 180 then 8
	    when sp_def >= 180
	    and sp_def < 200 then 9
	    else 10
	  end as sp_def_bin,
	  case
	    when speed < 20 then 0
	    when speed >= 20
	    and speed < 40 then 1
	    when speed >= 40
	    and speed < 60 then 2
	    when speed >= 60
	    and speed < 80 then 3
	    when speed >= 80
	    and speed < 100 then 4
	    when speed >= 100
	    and speed < 120 then 5
	    when speed >= 120
	    and speed < 140 then 6
	    when speed >= 140
	    and speed < 160 then 7
	    when speed >= 160
	    and speed < 180 then 8
	    when speed >= 180
	    and speed < 200 then 9
	    else 10
	  end as speed_bin,
	  tier,
	  tier_number
	from
	  pokemon_comparison_tier_table as pctt
	  inner join type_effectiveness as te on lower(pctt.primary_type) = te.primary_type
	  and (
	    lower(pctt.secondary_type) = te.secondary_type
	    or pctt.secondary_type =''
	    and te.secondary_type is null
	  )
	  left join ability_list as al on pctt.ability1 = al.name
	  left join ability_list as al2 on pctt.ability2 = al2.name
	  left join ability_list as al3 on pctt.ability3 = al3.name
	where
	  tier != 'National Dex';
