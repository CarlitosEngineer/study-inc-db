# Documentación

## Module - Accounts (Cuentas)

- Punto 1 - existirán dos tipos de cuentas las cuentas de los usuarios y las cuentas de los administradores 
- Punto 2 - los administradores tienen el poder de evitar o modificar las cuentas de usuario 
- Punto 3 - las cuentas de los usuarios sirven para almacenar el contenido del usuario tanta información personal como educativa siempre y cuando pertenezca al usuario 

#### **Tabla `accounts` (Identificación única del usuario)**
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
| `is_verified_user`| Booleano | `true` si el usuario ha sido verificado (ejemplo: KYC o manualmente). |
| `uses_dark_mode` | Booleano | `true` = Modo oscuro, `false` = Modo claro. |

| `gender_id`  | Entero (FK) | Referencia a `genders.id` (puede ser NULL). |
| `country_id` | Entero (FK) | Referencia a `countries.id`. (puede ser NULL). |
| `language_id` | Entero (FK) | Referencia a `languages.id`. (puede ser NULL). |

| `last_login` | Timestamp | Última fecha de inicio de sesión. |
| `created_at` | Timestamp | Fecha de creación de la cuenta. |
| `updated_at` | Timestamp | Fecha de la última actualización. |
