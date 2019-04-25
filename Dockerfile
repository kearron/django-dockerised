# start from an official image
FROM python:3.6

WORKDIR /docker/deploy/django-dockerised/hello/


COPY Pipfile Pipfile.lock /docker/deploy/django-dockerised/

RUN pip install pipenv && pipenv install --system

# install our two dependencies
RUN pip install gunicorn django

# copy our project code
COPY ./hello/* /docker/deploy/django-dockerised/hello/


# expose port 8000 to outside world
EXPOSE 8000

#define the default command to run when starting the container
CMD ["gunicorn","--bind",":8000","hello.wsgi:application"]


