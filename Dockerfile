# start from an official image
FROM python:3.7

# arbitrary location choice: you can change the directory
RUN mkdir -p /app
WORKDIR /app

# install our dependencies
# we use --system flag because we don't need an extra virtualenv
COPY Pipfile Pipfile.lock /app/
RUN pip install pipenv && pipenv install --system

COPY . /app

RUN ./manage.py collectstatic --no-input

# expose the port 8000
EXPOSE 8000

ENTRYPOINT ["docker-entrypoint.sh"]

# define the default command to run when starting the container
CMD ["gunicorn", "--chdir", "project", "--bind", ":8000", "project.wsgi:application"]
