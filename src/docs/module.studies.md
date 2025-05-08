# Documentación

## Module - Studies (Estudios)

##### ✅ 1. **Tabla `word_categories` (Categorías principales)**

La tabla `word_categories` define las categorías principales utilizadas para organizar las tarjetas de estudio. Algunos ejemplos de categorías son: *Animales*, *Comida* y *Profesiones*.

| Campo        | Tipo         | Descripción                            |
| ------------ | ------------ | -------------------------------------- |
| `id`         | Integer (PK) | Identificador único de la categoría.   |
| `name`       | Text         | Nombre de la categoría.                |
| `created_at` | Timestamp    | Fecha y hora de creación del registro. |
| `updated_at` | Timestamp    | Fecha y hora de última actualización.  |

🎯 **Reglas de negocio:**

* Las `word_categories` son **únicas** y no se repiten.
* Una `word_categories` puede tener **varias `word_subcategories` asociadas.**

##### ✅ 2. **Tabla `word_subcategories` (Subcategorías)**

La tabla `word_subcategories` permite definir subcategorías dentro de una categoría principal. Por ejemplo, *Animales domésticos* puede ser una subcategoría dentro de *Animales*.

| Campo         | Tipo         | Descripción                                            |
| ------------- | ------------ | ------------------------------------------------------ |
| `id`          | Integer (PK) | Identificador único de la subcategoría.                |
| `category_id` | Integer (FK) | Referencia a la categoría principal (`categories.id`). |
| `name`        | Text         | Nombre de la subcategoría.                             |
| `created_at`  | Timestamp    | Fecha y hora de creación del registro.                 |
| `updated_at`  | Timestamp    | Fecha y hora de última actualización.                  |

🎯 **Reglas de negocio:**

* Las `word_subcategories` son **únicas en todo el sistema** y no pueden repetirse, incluso si pertenecen a categorías diferentes.

##### ✅ 3. **Tabla `words` (Imágenes para Flashcards)**

La tabla almacena imágenes relacionadas con tarjetas de estudio, con **una imagen miniatura y una en alta resolución**.

| Campo            | Tipo         | Descripción                                  |
| ---------------- | ------------ | -------------------------------------------- |
| `id`             | Integer (PK) | Identificador único de la tarjeta.           |
| `image_icon_url` | Text         | URL de la imagen miniatura o icono.          |
| `image_real_url` | Text         | URL de la imagen completa (alta resolución). |
| `created_at`     | Timestamp    | Fecha y hora de creación.                    |
| `updated_at`     | Timestamp    | Fecha y hora de última actualización.        |

##### ✅ 4. **Tabla `word_translateds` (Traducciones de tarjetas)**

Esta tabla vincula cada tarjeta (`cards.id`) con su traducción en un idioma específico. Para la relación con idiomas usaremos el `languages.id` de tu tabla `languages` ya definida antes.

| Campo         | Tipo         | Descripción                                        |
| ------------- | ------------ | -------------------------------------------------- |
| `id`          | Integer (PK) | Identificador único de la traducción.              |
| `card_id`     | Integer (FK) | Referencia a la tarjeta asociada (`cards.id`).     |
| `language_id` | Integer (FK) | Referencia al idioma (`languages.id`).             |
| `word`        | Text         | Palabra traducida en el idioma indicado.           |
| `created_at`  | Timestamp    | Fecha y hora de creación del registro.             |
| `updated_at`  | Timestamp    | Fecha y hora de última actualización del registro. |

🎯 **Reglas de negocio:**
















✅ **Idiomas extraídos, sin repetir:**

01. Inglés
02. Mandarín
03. Hindi
04. Español
05. Francés
06. Árabe (estándar)
07. Bengalí
08. Portugués
09. Ruso
10. Urdu
11. Indonesio
12. Alemán
13. Japonés
14. Suajili
15. Coreano
16. Italiano

👉 Nota: "Mandarín" y "Chino mandarín" son lo mismo, solo contado una vez.












---

### ✅ 5. **Asociación de tarjetas con categorías/subcategorías**

Si **una tarjeta solo pertenece a una subcategoría**, puedes agregar una clave foránea directa en `cards`:

| Campo            | Tipo         | Descripción                                        |
| ---------------- | ------------ | -------------------------------------------------- |
| `subcategory_id` | Integer (FK) | Referencia a la subcategoría (`subcategories.id`). |

👉 Si **una tarjeta puede pertenecer a varias subcategorías al mismo tiempo**, entonces necesitas una **tabla de relación** así:

#### **Tabla `card_subcategory` (Relación tarjetas-subcategorías)**

| Campo            | Tipo         | Descripción                                        |
| ---------------- | ------------ | -------------------------------------------------- |
| `id`             | Integer (PK) | Identificador único del registro.                  |
| `card_id`        | Integer (FK) | Referencia a la tarjeta (`cards.id`).              |
| `subcategory_id` | Integer (FK) | Referencia a la subcategoría (`subcategories.id`). |

---

✅ **Notas adicionales:**

* Una subcategoría siempre pertenece a una categoría.
* Puedes usar solo categorías o categorías + subcategorías, según la complejidad que busques.
* Si planeas navegación por temas, estas tablas te ayudarán a estructurar rutas o filtros.

¿Prefieres la relación **uno a uno** (una tarjeta solo tiene una subcategoría) o **muchos a muchos** (una tarjeta puede estar en varias subcategorías)? Así puedo ajustarlo si necesitas. 😊











| Campo            | Tipo         | Descripción                                 |
| ---------------- | ------------ | ------------------------------------------- |
| `id`             | Integer (PK) | Identificador único de la palabra/concepto. |
| `image_icon_url` | Text         | URL de la imagen miniatura o ícono.         |
| `image_real_url` | Text         | URL de la imagen en alta resolución.        |
| `english`        | Text         | Palabra en inglés.                          |
| `mandarin`       | Text         | Palabra en mandarín.                        |
| `hindi`          | Text         | Palabra en hindi.                           |
| `spanish`        | Text         | Palabra en español.                         |
| `french`         | Text         | Palabra en francés.                         |
| `arabic`         | Text         | Palabra en árabe estándar.                  |
| `bengali`        | Text         | Palabra en bengalí.                         |
| `portuguese`     | Text         | Palabra en portugués.                       |
| `russian`        | Text         | Palabra en ruso.                            |
| `urdu`           | Text         | Palabra en urdu.                            |
| `indonesian`     | Text         | Palabra en indonesio.                       |
| `german`         | Text         | Palabra en alemán.                          |
| `japanese`       | Text         | Palabra en japonés.                         |
| `swahili`        | Text         | Palabra en suajili.                         |
| `korean`         | Text         | Palabra en coreano.                         |
| `italian`        | Text         | Palabra en italiano.                        |
| `created_at`     | Timestamp    | Fecha y hora de creación.                   |
| `updated_at`     | Timestamp    | Fecha y hora de última actualización.       |
