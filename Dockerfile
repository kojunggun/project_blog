FROM python:3.9.0

WORKDIR /home/

RUN echo "test"

RUN git clone https://github.com/kojunggun/project_blog.git

WORKDIR /home/project_blog

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

RUN echo "SECRET_KEY=_c%+g)97ku(u!4v#w7$9o%$-g6j1#!bv*w#s8ezg4!&3l=m5sn" > .env

RUN python manage.py collectstatic

EXPOSE 8000

CMD ["bash", "-c" ,"python manage.py migrate --settings=project_blog.settings.deploy && gunicorn project_blog.wsgi --env DJANGO_SETTINGS_MODULE=project_blog.settings.deploy --bind 0.0.0.0:8000"]