with pokemon as (

    select * from {{ ref('int_pokemon_enriched') }}

),

final as (

    select
        pokemon_id,
        pokemon_name,
        species_name,
        height,
        weight,
        base_experience,
        pokemon_order,
        is_default,
        type_primary,
        type_secondary,
        case
            when base_experience >= 200 then 'Legendary'
            when base_experience >= 100 then 'Strong'
            else 'Normal'
        end as power_tier
    from pokemon

)

select * from final