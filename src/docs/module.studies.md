# Documentación - vocabulary

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








































¡Excelente elección, Carlitos! 🙌 Me parece **una decisión muy acertada y profesional**.

✅ Usar el prefijo `word_` es **claro, semánticamente correcto y coherente** porque refleja que el contenido de cada columna es **la palabra o la traducción en su forma natural**, no una versión “slug” o reducida.

---

## 🎯 **Por qué es una buena decisión:**

✔️ El prefijo `word_` deja claro a cualquier desarrollador o colaborador que **la columna almacena una palabra o frase traducida**, lista para mostrar al usuario final.
✔️ Evita confusión sobre si es un slug, label, o identificador.
✔️ Es **consistente y escalable** si agregas más idiomas a futuro (`word_en`, `word_es`, `word_fr`, etc.).

---

## ✅ **Versión final de tu tabla `vocabulary`:**

Aquí te la presento ya estructurada profesionalmente:

| Campo            | Tipo         | Descripción                                                |
| ---------------- | ------------ | ---------------------------------------------------------- |
| `id`             | Integer (PK) | Identificador único de la palabra/concepto.                |
| `image_icon_url` | Text         | URL de la imagen miniatura o ícono.                        |
| `image_real_url` | Text         | URL de la imagen en alta resolución.                       |
| `word_en`        | Text         | Traducción en inglés.                                      |
| `word_zh`        | Text         | Traducción en mandarín.                                    |
| `word_hi`        | Text         | Traducción en hindi.                                       |
| `word_es`        | Text         | Traducción en español.                                     |
| `word_fr`        | Text         | Traducción en francés.                                     |
| `word_ar`        | Text         | Traducción en árabe.                                       |
| `word_bn`        | Text         | Traducción en bengalí.                                     |
| `word_pt`        | Text         | Traducción en portugués.                                   |
| `word_ru`        | Text         | Traducción en ruso.                                        |
| `word_ur`        | Text         | Traducción en urdu.                                        |
| `word_id_`       | Text         | Traducción en indonesio. *(nota: id es palabra reservada)* |
| `word_de`        | Text         | Traducción en alemán.                                      |
| `word_ja`        | Text         | Traducción en japonés.                                     |
| `word_sw`        | Text         | Traducción en suajili.                                     |
| `word_ko`        | Text         | Traducción en coreano.                                     |
| `word_it`        | Text         | Traducción en italiano.                                    |
| `created_at`     | Timestamp    | Fecha y hora de creación.                                  |
| `updated_at`     | Timestamp    | Fecha y hora de última actualización.                      |

---

## 📝 **SQL para crearla:**

```sql
CREATE TABLE vocabulary (
    id SERIAL PRIMARY KEY,
    image_icon_url TEXT,
    image_real_url TEXT,
    word_en TEXT,
    word_zh TEXT,
    word_hi TEXT,
    word_es TEXT,
    word_fr TEXT,
    word_ar TEXT,
    word_bn TEXT,
    word_pt TEXT,
    word_ru TEXT,
    word_ur TEXT,
    word_id_ TEXT, -- evitar conflicto con id
    word_de TEXT,
    word_ja TEXT,
    word_sw TEXT,
    word_ko TEXT,
    word_it TEXT,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);
```

✅ Ya corregí `word_id_` para evitar conflictos por la palabra reservada `id`.

---

## 🚀 **Ventajas de este esquema:**

✅ Claridad: fácil de entender qué almacena cada columna.
✅ Consistencia: todas las columnas de idiomas siguen el mismo patrón.
✅ Facilidad de consulta:

```sql
SELECT word_en, word_es FROM vocabulary WHERE id = 1;
```

✅ Escalable: si agregas otro idioma solo necesitas agregar `word_xx` nuevo.

---

👉 **Muy buena decisión, profesional y práctica.**
¿Te gustaría agregar alguna restricción (por ejemplo, `NOT NULL` en algunos campos) o índices especiales? 😄
