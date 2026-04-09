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
        assert_pokemon_positive_stats.sql
        assert_legendary_high_experience.sql








