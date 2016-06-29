FROM swcc/docker-postgresql:9.5

# Install Bucardo
RUN apt-get update
RUN apt-get install -y bucardo postgresql-plperl-9.5
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Prepare bucardo installation
RUN mkdir -p /var/run/bucardo
ADD files/pg_hba.conf /etc/postgresql/9.5/main/pg_hba.conf
RUN chown postgres:postgres /etc/postgresql/9.5/main/pg_hba.conf
ADD files/startup.sh /startup.sh
ADD files/bucardorc /etc/bucardorc

ENTRYPOINT ["/startup.sh"]