# Documentación

Esta es un programa diseñado para administracion del aplicativo basado en NodeJs y Express.

## Module - Global

### ✅ **Tabla `languages` (Lenguages)**

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

### ✅ **Table `genders` (generos)**
| Field                 | Type          | Description                                       |
| --------------------- | ------------- | ------------------------------------------------- |
| `id`                  | Integer (PK)  | Unique identifier for the gender.                 |
| `binary_value`        | Boolean       | Gender representation (`1` = Male, `0` = Female). |
| `slug`                | Text (Unique) | URL-friendly name (`male`, `female`).             |
| `char_representation` | Text (1)      | Single character representation (`M`, `F`).       |
| `language_code`       | Text (2)      | Language code ISO 639-1 (`en`, `es`, etc.).       |

### ✅ **Tabla `countries` (Países)**
Almacena información sobre los países según los estándares ISO 3166-1.
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

## Module - Accounts

### **Tabla `accounts` (Identificación única del usuario)**
Esta tabla almacena el **ID base del usuario** y actúa como referencia para las demás.  

| Campo    | Tipo        | Descripción |
|---------|------------|------------------------------------------------|
| `id`    | Entero (PK) | Identificador único del usuario. |

| `nick_name` | Texto (ÚNICO) | Apodo del usuario (No puede ser null). |
| `first_name` | Texto       | Nombre(s) del usuario (puede ser NULL si no se proporciona). |
| `last_name`  | Texto       | Apellido(s) del usuario (puede ser NULL si no se proporciona). |
| `birthdate`  | Fecha       | Fecha de nacimiento. |

| `score` | Entero | puntuacion de la cuenta, DEFAULT 0 |

| `email`      | Texto (ÚNICO) | Dirección de correo electrónico. |
| `password_hash` | Texto    | Contraseña en formato hash. |

| `is_verified` | Booleano  | `true` si el correo está verificado, `false` si no. |
| `is_verified_user` | Booleano | `true` si el usuario ha sido verificado (ejemplo: KYC o manualmente). |
| `uses_dark_mode` | Booleano | `true` = Modo oscuro, `false` = Modo claro. |

| `gender_id`  | Entero (FK) | Referencia a `genders.id` (puede ser NULL). |
| `country_id` | Entero (FK) | Referencia a `countries.id`. (puede ser NULL). |
| `language_id` | Entero (FK) | Referencia a `languages.id`. (puede ser NULL). |

| `last_login` | Timestamp | Última fecha de inicio de sesión. |
| `created_at` | Timestamp | Fecha de creación de la cuenta. |
| `updated_at` | Timestamp | Fecha de la última actualización. |

## Module - Otros

### **Tabla `statuses` (Estados de Citas)**
Almacena los diferentes estados posibles de una cita, permitiendo flexibilidad en caso de que se necesiten agregar nuevos estados en el futuro.

| Campo  | Tipo        | Descripción |
|--------|------------|------------------------------------------------|
| `id`   | Entero (PK) | Identificador único del estado. |
| `name` | Texto       | Nombre del estado (Ejemplo: "Pendiente", "Aprobado", "Rechazado"). |
| `slug` | Texto (ÚNICO) | Versión en texto plano (`pending`, `approved`, `rejected`). |
| `color_code` | Texto (7) | Código de color HEX (`#FFCC00` para "Pendiente", `#00CC00` para "Aprobado"). |
| `created_at` | Timestamp  | Fecha de creación del registro. |
| `updated_at` | Timestamp  | Fecha de la última actualización. |

## Module - cards

### ✅ **Tabla `cards` (Imágenes para Flashcards)**
Imágenes asociadas para ilustrar tarjetas de estudio visualmente.

| Campo               | Tipo          | Descripción                                           |
|---------------------|---------------|-------------------------------------------------------|
| `id`                | Entero (PK)   | Identificador único de la imagen asociada a la tarjeta. |
| `image_icon_url`    | Texto         | URL de la imagen en versión icono o miniatura.        |
| `image_real_url`    | Texto         | URL de la imagen completa (alta resolución).          |
| `created_at`        | Timestamp     | Fecha y hora de creación del registro.                |
| `updated_at`        | Timestamp     | Fecha y hora de la última actualización del registro. |

### ✅ **Tabla `translations` (Traducciones de tarjetas)**  
Traducciones asociadas a cada tarjeta según diferentes idiomas.

| Campo             | Tipo           | Descripción                                           |
|-------------------|----------------|-------------------------------------------------------|
| `id`              | Entero (PK)    | Identificador único de la traducción.                 |
| `card_id`         | Entero (FK)    | Referencia a la tarjeta asociada (`cards.id`).        |
| `languages_id`   | Entero (FK)  | Código ISO del idioma (`"en"`, `"es"`, `"eng"`).      |
| `word`            | Texto          | Palabra traducida en el idioma indicado.              |
| `created_at`      | Timestamp      | Fecha y hora de creación del registro.                |
| `updated_at`      | Timestamp      | Fecha y hora de la última actualización del registro. |
