FROM python:3.9.0

WORKDIR /home/

RUN git clone https://github.com/kojunggun/ko_homepage.git

WORKDIR /home/ko_homepage/project_blog

RUN pip install -r requirements.txt

git RUN echo "SECRET_KEY=_c%+g)97ku(u!4v#w7$9o%$-g6j1#!bv*w#s8ezg4!&3l=m5sn" > .env

RUN python manage.py migrate

EXPOSE 8800

CMD ["python", "manage.py", "--bind", "0.0.0.0:8800"]