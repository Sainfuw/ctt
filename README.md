# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## OpenVidu

OpenVidú funciona como una API REST

Para simplificar los llamados a esta API se creó una clase bajo ```lib/ov.rb``` y un método request que puede llamar hacer post a los dos endpoints mas importantes, el de sessions y el de token.

Estos endpoints permiten crear una sesión (esto en humano es iniciar la transmisión del video) y obtener un token (el cual sirve para conectarse a una transmisión existente)

## Para iniciar una transmisión

Se debe llamar al endpoint de **session**

```ruby
Ov.request("api/sessions", "post", {customSessionId: @course.name})
```

El resultado es un token que se necesita en el js para unirse a la sesión recién creada

```ruby
Ov.request("api/tokens", "post", {session: @course.name})
```

El resultado es un token que se necesita en el js para unirse a la sesión existente

Actualmente dentro de la vista courses#show está el javascript que usa el token para crear o unirse a la sesión.

## Reglas importantes:

- No se puede unir a una transmisión sin un token
- No se puede unir a una sesión que no existe
- No se pueden crear dos sesiones con el mismo nombre.  

## Propuesta de mejora (requerimientos faltantes)

- Dentro de courses#show debe existir un botón para iniciar transmisión
 - Se debe definir quien puede iniciar la transmisión (¿Sólo el profesor?)
 - El botón solo se debe mostrar si la sesión no ha sido iniciada
 	- Se requiere consultar contra un endpoint si se ha iniciado
 	- Al crear la sesión debe haber un botón de terminarla (se requiere llamar al endpoint)

- Debe existir un Botón para unirse a la sesión de video
	- El botón solo debe mostrarse si la sesión de video ya fue creada
	- Al entrar al cuarto se puede saber si la sesión ya fue creada para unirse directamente sin necesidad del botón (esto podría no ser deseado)


Entro como profesor y no hay sesión, veo el botón y la creo
	Hay que notificar a los alumnos que ya están en el sala
	El alumno que entra a la sala recibe el token y se une a la sesión
Entro como profesor y hay session, me uno
