with source as (

    select * from {{ source('raw', 'pokemon') }}

),

renamed as (

    select
        id as pokemon_id,
        name as pokemon_name,
        height,
        weight,
        base_experience,
        "order" as pokemon_order,
        is_default,
        location_area_encounters,
        species,
        types,
        stats,
        sprites
    from source

)

select * from renamed