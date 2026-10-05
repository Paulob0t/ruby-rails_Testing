# 🧪 Laboratorio de Ruby on Rails

Este es un proyecto de prueba y aprendizaje diseñado para explorar y comprender a fondo el funcionamiento interno de **Ruby on Rails** (arquitectura MVC, Active Record, rutas RESTful, Hotwire, convenciones y ciclo de vida de peticiones).

---

## 🚀 Requisitos del Entorno

- **Ruby:** `3.4+`
- **Rails:** `8.x`
- **Base de Datos:** PostgreSQL 16 (ejecutándose en un contenedor con Podman / Docker)
- **Frontend / JavaScript:** Hotwire (Turbo + Stimulus) vía Importmap

---

## ⚙️ Configuración y Puesta en Marcha

### 1. Base de datos (PostgreSQL en Podman)
Levantar el contenedor de PostgreSQL con las credenciales de desarrollo:

```bash
podman run -d --name rails_postgres16 \
  -e POSTGRES_USER=rails \
  -e POSTGRES_PASSWORD=secret \
  -e POSTGRES_DB=rails_lab_development \
  -p 127.0.0.1:5432:5432 \
  docker.io/library/postgres:16-alpine
```

### 2. Instalación de dependencias
```bash
bundle install
```

### 3. Preparación de la base de datos y migraciones
```bash
bin/rails db:prepare
bin/rails db:migrate
```

### 4. Iniciar el servidor de desarrollo
```bash
bin/rails server
```
La aplicación estará disponible en [http://localhost:3000/posts](http://localhost:3000/posts).

---

## 📚 Fases del Laboratorio

- **Fase 1: Setup y Scaffolding Base**
  - Configuración inicial de Rails omitiendo suites de prueba por defecto.
  - Conexión a PostgreSQL en `config/database.yml`.
  - Scaffolding de la entidad `Post` (`title:string`, `content:text`).
  - Mapeo de convenciones MVC y rutas REST canónicas.

- **Fase 2: Modelado Relacional y Rutas Jerárquicas**
  - Creación del modelo `Comment` (`content:text`, `author:string`, `post:references`).
  - Asociaciones Active Record (`has_many :comments, dependent: :destroy` y `belongs_to :post`).
  - Validaciones de presencia y rutas anidadas (`/posts/:post_id/comments`).

- **Fase 3: Controlador, Partials y Formularios**
  - Implementación de `CommentsController` (`create` y `destroy`) con *Strong Parameters*.
  - Renderizado modular con partials (`_comment.html.erb`, `_form.html.erb`).
  - Renderizado automático de colecciones en Action View (`<%= render @post.comments %>`).
