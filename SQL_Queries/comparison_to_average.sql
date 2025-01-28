create table pokemon.comparison_to_average as 
  select bp."name", 
  ct.pokemon_type, 
  (bp.total-ct.avg_total) as total_diff, 
  (bp.hp-ct.avg_hp) as hp_diff, 
  (bp.attack-ct.avg_attack) as attack_diff,
  (bp.defense-ct.avg_defense) as defense_diff, 
  (bp."sp. attack" - ct.avg_sp_attack) as sp_atk_diff, 
  (bp."sp. defense"-ct.avg_sp_defense) as sp_def_diff, 
  (bp.speed-ct.avg_speed) as speed_diff 
from pokemon.battle_pokedex as bp
join pokemon.common_types as ct on bp.type1=ct.pokemon_type or bp.type2=ct.pokemon_type 
where bp.evos is null and bp.forme is null and bp.restricted = false and bp.mythical=false;
