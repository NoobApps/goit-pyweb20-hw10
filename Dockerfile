FROM python:3.13-slim

WORKDIR /app

COPY . .

RUN pip install poetry
RUN poetry install --no-root

EXPOSE 8000

CMD ["python", "manage.py", "makemigrations", "quotes"]
CMD ["python", "manage.py", "migrate"]
CMD ["python", "migrate_mongo_to_postgres.py"]
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]