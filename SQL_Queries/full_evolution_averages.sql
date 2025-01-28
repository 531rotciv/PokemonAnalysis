create table pokemon.fully_evolved_type_averages as 
SELECT 
    CASE 
	    WHEN type2 IS NULL OR type2 = '' THEN type1
        WHEN type1 < type2 THEN type1 || '/' || type2
        ELSE type2 || '/' || type1
    END AS typecombo,
    round(AVG(total),2) as avg_total, 
    round(AVG(hp),2) as avg_hp,
    round(AVG(attack),2) as avg_attack,
    round(AVG(defense),2) as avg_defense, 
    round(AVG("sp. attack"),2) as avg_sp_attack, 
    round(AVG("sp. defense"),2) as avg_sp_defense, 
    round(AVG(speed),2) as avg_speed,
	count('name') as instances_of_type
FROM 
    pokemon.battle_pokedex
where evos is null and forme is null 
GROUP BY 
    CASE 
	    WHEN type2 IS NULL OR type2 = '' THEN type1
        WHEN type1 < type2 THEN type1 || '/' || type2
        ELSE type2 || '/' || type1
    END;
