# Web Accessibility Observatory (Docker Compose)

This is a fork of the Web Accessibility Observatory ([web](https://administracionelectronica.gob.es/pae_Home/pae_Estrategias/pae_Accesibilidad/pae_observatorio_accesibilidad_eng.html)|[repo](https://github.com/ctt-gob-es/oaw))
modified to be able to execute the accesibility analyzer tool from a Docker Compose build file.

## Requirements

 - [Docker Desktop](https://www.docker.com/products/docker-desktop)
 - [Maven 3.x or higher](https://maven.apache.org/download.cgi)

## Execution

 - Clone the repo
```
git clone https://github.com/jrodryb/oaw-docker
cd oaw-docker
```
 - Generate the WAR with Maven
```
mvn clean install -f oaw/pom.xml -P oaw -DskipTests
```
 - Run docker
```
docker compose up
```

## Application

Once Docker has started and all the containers are running, you can access:
- OAW Web App - [http://localhost:8888/oaw](http://localhost:8888/oaw)
   - You can access the admin section by logging in with "username:pass".
   
- OAW Accesibility Report Web App - [http://localhost:8888/oaw/diagnostico.html](http://localhost:8888/oaw/diagnostico.html)
   - Section that allows you to generate accesibility reports from webpages you specify and fake send them by email.

- Mailhog Web App - [http://localhost:8025](http://localhost:8025)
   - A fake SMTP server which shows you a simulated email inbox that will be used by the OAW Web App to send the generated reports.
