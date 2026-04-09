# Proyecto dbt - Tarea 6: Calidad, testing y documentación de datos



## Descripción

Este proyecto fue desarrollado como parte de la **tarea práctica de la Clase 6: Calidad y Testing de Datos** del curso *Introducción a la Ingeniería de Datos*. El objetivo es extender el proyecto dbt base incorporando testing, documentación y validación completa del pipeline con `dbt build`.



## Objetivo

Actualizar el proyecto dbt para incluir:



- instalación de `dbt-expectations`
- tests genéricos nativos de dbt
- tests avanzados con `dbt-expectations`
- singular tests personalizados
- documentación de modelos y columnas clave
- captura del DAG con documentación generada



Todos los tests deben pasar correctamente con `dbt build`. :contentReference\[oaicite:1]{index=1}



## Arquitectura del flujo

**Airbyte Cloud → MotherDuck → dbt**



- **Airbyte Cloud**: extracción y carga de datos

- **MotherDuck**: almacenamiento de datos

- **dbt**: transformación, testing y documentación



## Fuentes de datos utilizadas

Se trabajó con dos tablas crudas cargadas por Airbyte en la base `airbyte_curso`, esquema `main`:



- `pokemon`

- `iris_raw`



Las fuentes fueron declaradas en:



```text

models/staging/_sources.yml



Estructura del proyecto

proyecto\_dbt\_jessica\_tarea6

│   dbt\_project.yml

│   packages.yml

│   package-lock.yml

│   README.md

│   .gitignore

│

├───models

│   ├───staging

│   │       \_sources.yml

│   │       \_staging\_\_models.yml

│   │       stg\_pokeapi\_\_pokemon.sql

│   │       stg\_iris\_\_raw.sql

│   │

│   ├───intermediate

│   │       \_intermediate\_\_models.yml

│   │       int\_pokemon\_enriched.sql

│   │

│   └───marts

│           \_marts\_\_models.yml

│           obt\_pokemon\_analysis.sql

│

└───tests

&#x20;       assert\_pokemon\_positive\_stats.sql

&#x20;       assert\_legendary\_high\_experience.sql



Staging



stg\_pokeapi\_\_pokemon.sql



Modelo de limpieza y renombrado inicial para los datos provenientes de la tabla cruda pokemon.



stg\_iris\_\_raw.sql



Modelo de limpieza para iris\_raw, con conversión de tipos numéricos y generación de un identificador secuencial iris\_id.



Intermediate

int\_pokemon\_enriched.sql



Modelo intermedio que enriquece los datos de Pokémon extrayendo campos desde estructuras JSON, como:



species\_name

type\_primary

type\_secondary

Mart

obt\_pokemon\_analysis.sql



Modelo final tipo One Big Table (OBT) para análisis de Pokémon. Incluye una clasificación de poder basada en base\_experience:



Legendary

Strong

Normal

Testing implementado

1\. Tests genéricos de dbt



Se configuraron tests nativos como:



unique

not\_null

accepted\_values

relationships



Estos tests fueron definidos en archivos YAML asociados a los modelos. Los tests genéricos forman parte del enfoque recomendado por la clase para validar unicidad, completitud, integridad referencial y categorías permitidas.



2\. Tests con dbt-expectations



Se instaló el paquete dbt-expectations mediante packages.yml y dbt deps, tal como se indica en la clase.



Se utilizaron tests como:



expect\_table\_row\_count\_to\_be\_between

expect\_column\_values\_to\_be\_between

expect\_column\_values\_to\_match\_regex

3\. Singular tests personalizados



Se implementaron dos tests SQL personalizados en la carpeta tests/, siguiendo el esquema de singular tests explicado en la clase: el test falla si la query retorna filas.



assert\_pokemon\_positive\_stats.sql



Valida que no existan Pokémon con valores negativos en:



height

weight

base\_experience

assert\_legendary\_high\_experience.sql



Valida la regla de negocio:



si power\_tier = 'Legendary', entonces base\_experience >= 200

Documentación



Se documentaron todos los modelos y columnas clave mediante archivos YAML. La documentación generada por dbt incluye:



descripciones de modelos y columnas

tests configurados

DAG interactivo de dependencias

código SQL compilado

linaje de datos



Esto coincide con lo señalado en la clase sobre documentación en dbt.







