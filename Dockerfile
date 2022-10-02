FROM python:3.8

RUN mkdir /app

COPY requirements.txt .

RUN pip3 install -r requirements.txt

COPY . /app/

WORKDIR /app/

ENTRYPOINT ["python", "/app/app.py"]

EXPOSE $PORT

CMD gunicorn --workers=4 --bind 0.0.0.0:$PORT app:app