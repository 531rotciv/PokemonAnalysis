create table pokemon_stat_table (
  uid integer,
  Name varchar(200),
  Typing varchar(100),
  Total integer,
  HP integer,
  Attack integer,
  Defense integer,
  Sp_Atk integer,
  Sp_Def integer,
  Speed integer
);

create table pokemon.battle_pokedex (
  num integer,
  name text,
  types text[],
  HP integer,
  Attack integer,
  Defense integer,
  Sp_Atk integer,
  Sp_Def integer,
  Speed integer,
  abilities text[],
  evos text[],
  eggGroups text[],
  prevo text,
  forme text);


ALTER TABLE pokemon.battle_pokedex
ADD COLUMN row_number INTEGER;

-- Step 2: Update the new column with row numbers
UPDATE pokemon.battle_pokedex
SET row_number = subquery.row_num
FROM (
    SELECT "num", "name", ROW_NUMBER() OVER (ORDER BY "num", "name") AS row_num
    FROM pokemon.battle_pokedex
) AS subquery
WHERE pokemon.battle_pokedex.num = subquery."num" and pokemon.battle_pokedex."name" = subquery."name";
