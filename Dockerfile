FROM python:3.8.3-buster

RUN apt-get update && apt-get install ffmpeg zlib* libjpeg* --assume-yes 
RUN pip install --upgrade pip && pip install pipenv

WORKDIR /unicorn-gif-cli

COPY Pipfile Pipfile
COPY Pipfile.lock Pipfile.lock

RUN pipenv install --deploy

COPY . .

ENTRYPOINT ["pipenv", "run", "gif-for-cli", "-l", "0", "unicorn.gif"]

