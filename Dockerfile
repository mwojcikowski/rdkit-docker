FROM continuumio/miniconda

# Setup user
#RUN useradd rdkit
#RUN echo "rdkit:rdkit" | chpasswd
#RUN mkdir /home/rdkit; chown rdkit /home/rdkit
#USER rdkit
#WORKDIR /home/rdkit

RUN conda config --add channels rdkit
RUN conda install -y rdkit rdkit-postgresql supervisor

RUN useradd postgres
RUN mkdir -p /var/lib/postgresql/data

COPY supervisor/postgresql.conf /etc/supervisor/conf.d/postgresql.conf

CMD ["/usr/bin/supervisord"]
#, "-c", "/etc/supervisor/conf.d/postgresql.conf"]
