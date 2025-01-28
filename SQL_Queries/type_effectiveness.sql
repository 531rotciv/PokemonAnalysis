	drop table if exists type_effectiveness;
	create table type_effectiveness as
	select
	  row_number() over() as row_id,
	  wc.comparison_type as primary_type,
	  wc2.comparison_type as secondary_type,
	  CASE
	    when wc.comparison_type = wc2.comparison_type then wc.water
	    else CAST((wc.water * wc2.water) as numeric(3, 2))
	  end as water_effectiveness,
	  CASE
	    when wc.comparison_type = wc2.comparison_type then wc.fire
	    else CAST((wc.fire * wc2.fire) as numeric(3, 2))
	  end as fire_effectiveness,
	  CASE
	    when wc.comparison_type = wc2.comparison_type then wc.grass
	    else CAST((wc.grass * wc2.grass) as numeric(3, 2))
	  end as grass_effectiveness,
	  CASE
	    when wc.comparison_type = wc2.comparison_type then wc.electric
	    else CAST((wc.electric * wc2.electric) as numeric(3, 2))
	  end as electric_effectiveness,
	  CASE
	    when wc.comparison_type = wc2.comparison_type then wc.poison
	    else CAST((wc.poison * wc2.poison) as numeric(3, 2))
	  end as poison_effectiveness,
	  CASE
	    when wc.comparison_type = wc2.comparison_type then wc.flying
	    else CAST((wc.flying * wc2.flying) as numeric(3, 2))
	  end as flying_effectiveness,
	  CASE
	    when wc.comparison_type = wc2.comparison_type then wc.ground
	    else CAST((wc.ground * wc2.ground) as numeric(3, 2))
	  end as ground_effectiveness,
	  CASE
	    when wc.comparison_type = wc2.comparison_type then wc.rock
	    else CAST((wc.rock * wc2.rock) as numeric(3, 2))
	  end as rock_effectiveness,
	  CASE
	    when wc.comparison_type = wc2.comparison_type then wc.steel
	    else CAST((wc.steel * wc2.steel) as numeric(3, 2))
	  end as steel_effectiveness,
	  CASE
	    when wc.comparison_type = wc2.comparison_type then wc.psychic
	    else CAST((wc.psychic * wc2.psychic) as numeric(3, 2))
	  end as psychic_effectiveness,
	  CASE
	    when wc.comparison_type = wc2.comparison_type then wc.dark
	    else CAST((wc.dark * wc2.dark) as numeric(3, 2))
	  end as dark_effectiveness,
	  CASE
	    when wc.comparison_type = wc2.comparison_type then wc.ghost
	    else CAST((wc.ghost * wc2.ghost) as numeric(3, 2))
	  end as ghost_effectiveness,
	  CASE
	    when wc.comparison_type = wc2.comparison_type then wc.bug
	    else CAST((wc.bug * wc2.bug) as numeric(3, 2))
	  end as bug_effectiveness,
	  CASE
	    when wc.comparison_type = wc2.comparison_type then wc.fighting
	    else CAST((wc.fighting * wc2.fighting) as numeric(3, 2))
	  end as fighting_effectiveness,
	  CASE
	    when wc.comparison_type = wc2.comparison_type then wc.normal
	    else CAST((wc.normal * wc2.normal) as numeric(3, 2))
	  end as normal_effectiveness,
	  CASE
	    when wc.comparison_type = wc2.comparison_type then wc.dragon
	    else CAST((wc.dragon * wc2.dragon) as numeric(3, 2))
	  end as dragon_effectiveness,
	  CASE
	    when wc.comparison_type = wc2.comparison_type then wc.ice
	    else CAST((wc.ice * wc2.ice) as numeric(3, 2))
	  end as ice_effectiveness,
	  CASE
	    when wc.comparison_type = wc2.comparison_type then wc.fairy
	    else CAST((wc.fairy * wc2.fairy) as numeric(3, 2))
	  end as fairy_effectiveness
	from
	  weakness_chart as wc,
	  weakness_chart as wc2;

	DELETE FROM type_effectiveness
	WHERE (row_id) IN
	(SELECT B.row_id FROM
	type_effectiveness A, type_effectiveness B
	WHERE A.primary_type = B.secondary_type
	  AND A.secondary_type = B.primary_type)
