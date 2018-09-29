
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

# Instalación de OpenVidu

## Instalar un http server (para realizar los desafíos de certbot)

apt install npm
npm install -g http-server
levantar el server http-server -p 80

## Instalación de Certbot (revisar https://certbot.eff.org/lets-encrypt)

sudo apt-get update
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install certbot 

## Autorización del certificado

sudo certbot certonly --webroot -w . -d desafiostreaming.tk

 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/desafiostreaming.tk/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/desafiostreaming.tk/privkey.pem
   Your cert will expire on 2018-11-27. To obtain a new or tweaked
   version of this certificate in the future, simply run certbot
   again. To non-interactively renew *all* of your certificates, run
   "certbot renew"
 - If you like Certbot, please consider supporting our work by:

## Resultado de la autorización

Los certificados (full chain y privacy) quedarán /etc/letsencrypt/live/

Ejemplo:

/etc/letsencrypt/live/desafiostreaming.tk/fullchain.pem
/etc/letsencrypt/live/desafiostreaming.tk/privkey.pem

## Generando el certificado en pkcs12 para openvidu

openssl pkcs12 -export -in fullchain.pem -inkey privkey.pem -out h.p12 \
-name desafiostreaming.tk -passin pass:password1234 -passout pass:password1234

keytool -importkeystore -srckeystore h.p12 -srcstoretype PKCS12 \
-srcstorepass password1234 -alias desafiostreaming.tk -deststorepass password1234 \
-destkeypass password1234 -destkeystore h.jks

java -Dopenvidu.secret=YOUR_SECRET -Dserver.ssl.key-store=/etc/letsencrypt/live/desafiostreaming.tk/h.jks -Dserver.ssl.key-store-password=password1234 -Dserver.ssl.key-alias=desafiostreaming.tk -Dopenvidu.publicurl=https://desafiostreaming.tk:4443 -jar openvidu-server-2.4.0.jar 

