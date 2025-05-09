













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


slug_

"Inglés"	"en"
"Mandarín"	"zh"
"Hindi"	"hi"
"Español"	"es"
"Francés"	"fr"
"Árabe"	"ar"
"Bengalí"	"bn"
"Portugués"	"pt"
"Ruso"	"ru"
"Urdu"	"ur"
"Indonesio"	"id"
"Alemán"	"de"
"Japonés"	"ja"
"Suajili"	"sw"
"Coreano"	"ko"
"Italiano"	"it"