FROM postgres
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install postgresql
RUN apt-get -y install postgis
RUN apt-get -y install systemctl
RUN systemctl start postgresql
RUN su -l postgres 
# RUN psql -h localhost -p 8181 -U postgres -f {/var/lib/postgresql/data}