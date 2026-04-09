select
    pokemon_id,
    pokemon_name,
    height,
    weight,
    base_experience
from {{ ref('stg_pokeapi__pokemon') }}
where height < 0
   or weight < 0
   or base_experience < 0