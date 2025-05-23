# study-inc-db

**study-inc-db** es un proyecto para la administracion y diseño de la base de datos de **study-inc** 

## 📂 Content (Contenido)

- **Código SQL** - `src`: es el mismo codigo contenido en el archivo backups, solo que en formato sql que usado postgreSQL.
- **Diagramas UML** - `schema`: Representaciones visuales que ilustran la estructura y relaciones entre las tablas.
- **Copias de seguridad** - `backups`: Archivos de respaldo de la base de datos en distintos puntos del tiempo.
- **Automatización de procesos** - `scripts`: Scripts que simplifican tareas recurrentes, como backups automáticos, migraciones y limpieza de datos.

## ⛔ Rules (Reglas).

### Reglas por tipo de objeto:

| **Objeto**  | **Convención recomendada**                          |
| ----------- | --------------------------------------------------- |
| Tablas      | `snake_case`                                        |
| Columnas    | `snake_case`                                        |
| Funciones   | `snake_case`                                        |
| Vistas      | `snake_case`                                        |
| Índices     | `snake_case`, con prefijos tipo `idx_`              |
| Secuencias  | `snake_case`, con prefijos tipo `seq_`              |
| Esquemas    | `snake_case`, (cuando no es `public`)               |
| Constraints | `snake_case`, con sufijos tipo `_pk`, `_fk`, `_chk` |