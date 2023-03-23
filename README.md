# Virtualisation docker compose

## 1. Machine docker avec : apache (+ xdebug), postgres (+ postgis), et pgadmin

**Configuration réseau :**
Serveur Web "Apache" : _accès via @ip:89_
Serveur de nase de donnée "PostgresSQL" : _accès via @ip:8181_
Interface de gestion "Pgadmin" : _accès via @ip:5050_

⚠️ Ce repository nous permet de créer un compose avec notre SAE du semestre 3 qui est directement relié à notre base de données MySQL et gérée grace à son interface graphique par PhpMyAdmin comme pour le premier travail (Vous pourrez retrouver toutes les informations concernant MySQL et PhpMyAdmin sur le repository précédent : https://github.com/Yuyugnat/docker-compose-tp ). Nous avons quand même installé postgres et pgadmin comme demandé. ⚠️

## 2. Prérequis 

### I. Installer Docker Desktop

#### Windows
Installation de Docker sous windows =>
Suivre https://docs.docker.com/desktop/install/windows-install/

#### Mac Intel
Installation de Docker sous mac intel =>
Suivre https://docs.docker.com/desktop/install/mac-install/ 

#### Mac M1
Installation de Docker sous mac m1 =>
Suivre https://docs.docker.com/desktop/install/mac-install/

#### Linux
Installation de Docker sous linux =>
Suivre : https://docs.docker.com/desktop/install/linux-install/ 

#### II. Cloner le dépot
Cloner normalement de dépôt git.

## 3. Créer le "compose" contenant apache, mysql, phpmyadmin et minetest

Le "compose" aura un nom associé à celui du dossier dans lequel la commande a été faites. Ici, on aura un dossier nommé "docker".

Une fois le dépôt cloné dans un dossier, ouvrez un terminal dans celui-ci et tapez les commandes suivantes : ```$docker compose build``` puis ```$ docker compose up -d```

Vous pourrez par la suite voir que votre "compose" a été créé et bien mis en route avec la commande : ```$ docker compose ls```

Vous pouvez arrêter votre "compose" avec la commande :
```$ docker-compose -p nomducomposant stop```

Vous pouvez relancer votre "compose" avec la commande :
```$ docker-compose -p docker start```

## 4. Mettre des données sur son serveur Apache

### I. Initialisation

Assurez-vous que votre serveur est bien lancé avec la commande : ```$ docker ps```
Si ce n'est pas le cas, entrez la commande suivante : ```$ docker start nomduservice```
Vous trouverez le nom du service en tapant la commande : ```$ docker ps -a```

### II. Ajouter un fichier

Dans votre dossier de base, créez un dossier "Web90" (par exemple) puis un autre dossier à l'intérieur nommé "html". Vous pouvez insérer un fichier html ou php qui sera directement lu et connecté au service apache.

Si cela ne marche pas faites la commande : ```$ docker inspect idduserviceapache```
Et vérifiez que les dossiers sources correspondent bien au nom des dossiers donnés précédemment :
```
            "Source": "/Users/doriangrasset/Documents/docker/web90/html",
            "Destination": "/var/www/html",
```
Ces fichiers, positionnés dans le dossier source, seront directement reliés à un dossier destination lu par apache et qui permettra le bon fonctionnement. 

Vous pouvez aussi trouver ces données dans votre fichier : ```docker-compose.yml```.

### III. Lancer le serveur apache

Lancer votre navigateur et rentrez l'URL suivante : ```http://localhost:{portapache}/``` ici le {portapache} = 89.
Vous pouvez retrouver ce port en faisant la commande : ```$ docker ps```et en regardant l'information "PORTS" du service apache.

## 4. Connecter sa base de donnée Postgres à PgAdmin

### I. Initialisation

Vérifiez que postgres et pgadmin soit bien lancé (l'un ne démarrera pas sans l'autre) avec la commande : ```$ docker ps```

S'il ne sont pas lancés (ou si il faut en démarrer un des deux), rentrez la commande suivante dans votre terminal : ```$ docker start nomduservice```

Vous trouverez le nom du service en tapant la commande : ```$ docker ps -a```

### II. Lancez le navigateur

Lancer votre navigateur et rentrez l'URL suivante : ```http://localhost:{portpgadmin}/``` ici le {pgadmin} = 5050.
Vous pouvez retrouver ce port en faisant la commande : ```$ docker ps``` et en regardant l'information "PORTS" du service phpmyadmin.

### III. Connectez vous à votre base de donnée Postgres

L'interface graphique de pgadmin apparaîtra normalement et vous devrez vous connecter.
Pour ce faire, trouvez le mot de passe ainsi que l'identifiant de votre base de données en tapant la commande suivante dans votre terminal : ```$ docker inspect iddepostgres```. Vous devriez tomber sur quelque chose de similaire :
```
        "Env": [
                "PGADMIN_DEFAULT_EMAIL=dorian.grasset@etu.umontpellier.fr",
                "PGADMIN_DEFAULT_PASSWORD=pgadmin",
                "POSTGRES_PASSWORD=postgres",
                "POSTGRES_USER=postgres",
                "POSTGRES_DB=postgres",
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/lib/postgresql/15/bin",
                "GOSU_VERSION=1.16",
                "LANG=en_US.utf8",
                "PG_MAJOR=15",
                "PG_VERSION=15.2-1.pgdg110+1",
                "PGDATA=/var/lib/postgresql/data"
            ],
```

Vous constatez ici que l'identifiant et le mot de passe sont ```postgres```.
Rentrez donc ces informations dans le champ de connexion.
Vous êtes connecté !

Vous pouvez aussi trouver ces données dans votre fichier : ```docker-compose.yml```.