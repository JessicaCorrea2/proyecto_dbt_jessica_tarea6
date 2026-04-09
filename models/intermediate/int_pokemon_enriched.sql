with pokemon as (

    select * from {{ ref('stg_pokeapi__pokemon') }}

),

enriched as (

    select
        pokemon_id,
        pokemon_name,
        height,
        weight,
        base_experience,
        pokemon_order,
        is_default,
        location_area_encounters,
        species,
        species->>'name' as species_name,
        types,
        types->0->'type'->>'name' as type_primary,
        types->1->'type'->>'name' as type_secondary,
        stats,
        sprites
    from pokemon

)

select * from enriched