FROM python:3.6-alpine

#MAINTAINER jverner "jverner@evektor.cz"

#COPY ./app/requirements.txt /app/requirements.txt

#RUN adduser -D jverner

RUN mkdir /app
COPY ./app /app
WORKDIR /app

RUN chmod +x run.sh

#RUN pip install pipenv
#RUN pipenv install -r requirements.txt
#RUN pipenv install gunicorn

RUN pip install -r requirements.txt


ENV FLASK_APP app.py
ENV FLASK_DEBUG 1

#RUN chown -R jverner:statikau ./
#USER jverner

EXPOSE 5000
#ENTRYPOINT ["./run.sh"]
ENTRYPOINT ["gunicorn", "-b", ":5000", "--access-logfile", "-", "--error-logfile", "-", "app:app"]
