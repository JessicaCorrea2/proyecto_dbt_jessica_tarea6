select
    pokemon_id,
    pokemon_name,
    power_tier,
    base_experience
from {{ ref('obt_pokemon_analysis') }}
where power_tier = 'Legendary'
  and base_experience < 200