drop table if exists pokemon_comparison_table;
create table pokemon_comparison_table as
select
  pst.name,
  (total - avg_total) as bst_diff_total,
  (hp - avg_hp) as bst_diff_hp,
  (attack - avg_atk) as bst_diff_atk,
  (defense - avg_def) as bst_diff_def,
  (sp_atk - avg_sp_atk) as bst_diff_sp_atk,
  (sp_def - avg_sp_def) as bst_diff_sp_def,
  (speed - avg_speed) as bst_diff_speed,
  avg_total,
  avg_hp,
  avg_atk,
  avg_def,
  avg_sp_atk,
  avg_sp_def,
  avg_speed,
  total,
  hp,
  attack,
  defense,
  sp_atk,
  sp_def,
  speed,
  legendary,
  mythical,
  pet.final_evolution
from
  pokemon_stat_table as pst
  join pokemon_evolution_table as pet on pst.name = pet.name
  join average_pokemon_stats as apt on pet.final_evolution = apt.final_evolution;
