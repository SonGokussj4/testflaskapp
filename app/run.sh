#!/bin/sh

exec pipenv run gunicorn -b :5000 --access-logfile - --error-logfile - app:app
