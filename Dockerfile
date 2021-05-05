FROM python:3.9-slim-buster

WORKDIR /app

RUN apt-get update -u && apt-get install -y \
        supervisor

COPY api.conf /etc/supervisor/conf.d/api.conf
RUN ln -s /etc/supervisor/supervisord.conf /etc/supervisord.conf

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
