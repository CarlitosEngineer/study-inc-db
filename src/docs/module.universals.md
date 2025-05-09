# Documentación

## Module - Universals (Universals)

El modulo universal, consiste en almacenar todas aquellas tablas que sirvan para casos de uso general y no tengan una relacion especial con ningun modulo en especifico.

##### ✅ 1. **Tabla `genders` (universal)**

> Esta tabla representa los géneros básicos en inglés y servirá como referencia universal. Usamos un **`boolean` como PK**, donde `TRUE` = Male, `FALSE` = Female.

| Campo                 | Tipo         | Descripción                                                 |
| --------------------- | ------------ | ----------------------------------------------------------- |
| `id`        | Boolean (PK) | Valor binario del género (`TRUE` = Male, `FALSE` = Female). |
| `slug`                | Text         | Nombre URL-friendly (`male`, `female`).                     |
| `char_representation` | Text (1)     | Representación corta (`M`, `F`).                            |

##### ✅ 2. **Tabla `gender_translations` (traducciones por idioma)**

> Esta tabla se apoya en la tabla `genders` (por `binary_value`) y en `languages` (por `language_code_2`) para registrar traducciones.

| Campo             | Tipo         | Descripción                                                   |
| ----------------- | ------------ | ------------------------------------------------------------- |
| `id`              | Integer (PK) | Identificador único de la traducción.                         |
| `gender_id`       | Boolean      | FK a `genders(binary_value)`, representa el género.           |
| `language_id`     | Integer      | FK a `languages(id)`, representa el idioma de traducción.     |
| `translated_slug` | Text         | Slug traducido (`masculino`, `femenino`, etc.).               |
| `translated_char` | Text (1)     | Letra correspondiente en el idioma (`H` para "Hombre", etc.). |

##### ✅ 3. **Tabla `languages` (lenguages)**

> Esta tabla contiene una lista de idiomas

| Campo             | Tipo              | Descripción |
|-------------------|-------------------|-------------------------------------------|
| `id`              | Entero (PK)       | Identificador único del idioma (clave primaria).          |
| `language_name`   | Texto (ÚNICO)     | Nombre del idioma (Ej: Español, English, Français). |
| `code_2` | Texto (2) (ÚNICO) | Código ISO de 2 letras del idioma (Ej: "es", "en", "fr"). |
| `code_3` | Texto (3) (ÚNICO) | Código ISO de 3 letras del idioma (Ej: "spa", "eng", "fra"). |
| `text_direction`  | Texto (3)         | Dirección del texto: "LTR" (Left to Right) o "RTL" (Right to Left). |
| `is_active`       | Booleano          | Indica si el idioma está activo (true) o inactivo (false). |
| `created_at`      | Timestamp         | Fecha y hora de creación del registro. |
| `updated_at`      | Timestamp         | Fecha y hora de la última modificación del registro. |

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





## 📄 **Tabla `languages`**

> Esta tabla almacena los idiomas soportados por la aplicación, incluyendo códigos ISO y dirección de escritura.

| **Columna**  | **Tipo**      | **Restricciones**                    | **Descripción**                                                     |
| ------------ | ------------- | ------------------------------------ | ------------------------------------------------------------------- |
| `id`         | `integer`     | `PRIMARY KEY`                        | Identificador único del idioma.                                     |
| `name`       | `varchar(50)` | `UNIQUE`, `NOT NULL`                 | Nombre del idioma (Ej: Español, English, Français).                 |
| `name_code2` | `char(2)`     | `UNIQUE`, `NOT NULL`                 | Código ISO de 2 letras del idioma (Ej: "es", "en", "fr").           |
| `name_code3` | `char(3)`     | `UNIQUE`, `NOT NULL`                 | Código ISO de 3 letras del idioma (Ej: "spa", "eng", "fra").        |
| `direction`  | `char(3)`     | `CHECK ('LTR' OR 'RTL')`, `NOT NULL` | Dirección del texto: "LTR" (Left to Right) o "RTL" (Right to Left). |
| `is_active`  | `boolean`     | `DEFAULT false`                      | Indica si el idioma está activo (`true`) o inactivo (`false`).      |
| `created_at` | `timestamp`   | `DEFAULT CURRENT_TIMESTAMP`          | Fecha y hora de creación del registro.                              |
| `updated_at` | `timestamp`   | `DEFAULT CURRENT_TIMESTAMP`          | Fecha y hora de la última modificación del registro.                |

---

### 🔑 **Restricciones adicionales**

| **Restricción**             | **Descripción**                                                 |
| --------------------------- | --------------------------------------------------------------- |
| `languages_pkey`            | Clave primaria basada en la columna `id`.                       |
| `languages_direction_check` | Valida que la dirección del texto sea únicamente `LTR` o `RTL`. |

---

### ⚙️ **Trigger asociado**

| **Trigger**                                   | **Evento**      | **Descripción**                                                                                         |
| --------------------------------------------- | --------------- | ------------------------------------------------------------------------------------------------------- |
| `trigger_languages_refresh_column_updated_at` | `BEFORE UPDATE` | Actualiza automáticamente la columna `updated_at` antes de cualquier operación `UPDATE` sobre la tabla. |

---

✅ **Notas**:

* La tabla está **preparada para soportar múltiples idiomas** con su respectiva metadata (nombre, código ISO, dirección de texto).
* El trigger garantiza que siempre se mantenga actualizado el campo `updated_at` sin intervención manual.
* Las **restricciones de unicidad** aseguran integridad en los códigos y nombres de idioma.

---

Puedes copiar este bloque directamente en tu `README.md` o adaptarlo si necesitas incluir más detalles o ejemplos de uso.

👉 **Sugerencia adicional**: si tu proyecto crece, podrías agregar un pequeño ejemplo de **consulta o inserción** al final del README, para que otros desarrolladores sepan cómo usar la tabla.

¿Te gustaría que agregara esos ejemplos o alguna aclaración más? 😊







