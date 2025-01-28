	select
	  name,
	  primary_type,
	  secondary_type,
	  tier,
	  ability1,
	  ability2,
	  ability3,
	  total,
	  hp,
	  attack,
	  defense,
	  sp_atk,
	  sp_def,
	  speed
	from
	  pokemon_comparison_tier_table
	where
	  primary_type = 'Fire'
	  and name not like '%Mega%'
	  and tier != 'National Dex'
	order by
	  tier_number;
