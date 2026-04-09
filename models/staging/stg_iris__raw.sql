with source as (

    select * from {{ source('raw', 'iris_raw') }}

),

renamed as (

    select
        row_number() over () as iris_id,
        species,
        cast(sepal_length as double) as sepal_length,
        cast(sepal_width as double) as sepal_width,
        cast(petal_length as double) as petal_length,
        cast(petal_width as double) as petal_width,
        _airbyte_extracted_at as extracted_at
    from source

)

select * from renamed