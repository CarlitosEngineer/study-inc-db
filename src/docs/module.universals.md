# Documentación

## Module - Universals (Universals)

El modulo universal, consiste en almacenar todas aquellas tablas que sirvan para casos de uso general y no tengan una relacion especial con ningun modulo en especifico.

##### ✅ 1. **Tabla `genders` (universal)**

> Esta tabla representa los géneros básicos en inglés y servirá como referencia universal. Usamos un **`boolean` como PK**, donde `TRUE` = Male, `FALSE` = Female.

| Campo                 | Tipo         | Descripción                                                 |
| --------------------- | ------------ | ----------------------------------------------------------- |
| `binary_value`        | Boolean (PK) | Valor binario del género (`TRUE` = Male, `FALSE` = Female). |
| `slug`                | Text         | Nombre URL-friendly (`male`, `female`).                     |
| `char_representation` | Text (1)     | Representación corta (`M`, `F`).                            |

##### ✅ 2. **Tabla `gender_translations` (traducciones por idioma)**

> Esta tabla se apoya en la tabla `genders` (por `binary_value`) y en `languages` (por `language_code_2`) para registrar traducciones.

| Campo             | Tipo         | Descripción                                                   |
| ----------------- | ------------ | ------------------------------------------------------------- |
| `id`              | Integer (PK) | Identificador único de la traducción.                         |
| `binary_value`    | Boolean      | FK a `genders(binary_value)`, representa el género.           |
| `language_id`     | Integer      | FK a `languages(id)`, representa el idioma de traducción.     |
| `translated_slug` | Text         | Slug traducido (`masculino`, `femenino`, etc.).               |
| `translated_char` | Text (1)     | Letra correspondiente en el idioma (`H` para "Hombre", etc.). |

##### ✅ 3. **Tabla `languages` (lenguages)**

> Esta tabla contiene una lista de idiomas

| Campo        | Tipo        | Descripción |
|-------------|------------|-------------------------------------------|
| `id`        | Entero (PK) | Identificador único del idioma.          |
| `language_name` | Texto   | Nombre del idioma (ej. "English", "Español"). |
| `language_code_2` | Texto (2) | Código ISO 639-1 (ej. "en", "es"). |
| `language_code_3` | Texto (3) | Código ISO 639-2/3 (ej. "eng", "spa"). |
| `text_direction` | Texto (3) | Enum Writing & read directions (`"LTR"`, `"RTL"`) |
| `is_active` | Booleano | Define si el idioma está activo en el sistema. |
| `created_at` | Timestamp | Fecha de creación del registro. |
| `updated_at` | Timestamp | Fecha de la última actualización. |

##### ✅ 4. **Tabla `countries` (países)**

> Almacena información sobre los países según los estándares ISO 3166-1.

| Campo         | Tipo        | Descripción |
|--------------|------------|------------------------------------------------|
| `id`         | Entero (PK) | Identificador único del país. |
| `name`       | Texto (ÚNICO) | Nombre del país. |
| `iso3166_2`  | Texto (2)  | Código ISO 3166-1 alfa-2. |
| `iso3166_3`  | Texto (3)  | Código ISO 3166-1 alfa-3. |
| `num_code`   | Texto (3) | Código numérico de 3 dígitos del país. |
| `phone_code` | Texto (1-4) | Código de marcación internacional. |
| `created_at` | Timestamp | Fecha de creación del registro. |
| `updated_at` | Timestamp | Fecha de la última actualización. |
