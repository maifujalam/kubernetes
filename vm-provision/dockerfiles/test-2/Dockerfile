#syntax=docker/dockerfile:1.2
FROM python:3.8-alpine as base

LABEL author=akmaifujalam

RUN pwd

ENV environment dev

WORKDIR /myapp

COPY . .

EXPOSE 5002
#
#RUN pip install -r requirements.txt

RUN --mount=type=secret,id=mysecret cat mysecret.txt

RUN pwd

ENTRYPOINT ["python"]

CMD ["app.py"]