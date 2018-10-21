## Build the Image

```bash
docker build -t djangoapp .
```

## Launch the Containers

```bash
docker-compose up
```

## Django Commands

These additional commands are needed to run data migrations and to create a user for the applicaiton.

Run migrations and exit.
```bash
docker-compose exec djangoapp python manage.py migrate
```

Note: the use of `run` allows you to have an interactive session while creating the superuser.
```bash
docker-compose run djangoapp python manage.py createsuperuser
```

