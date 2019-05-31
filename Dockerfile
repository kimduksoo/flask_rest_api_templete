FROM python:3.7

WORKDIR /opt/rest-api

COPY requirements.txt ./
RUN pip install -r requirements.txt

COPY src ./
EXPOSE 8080

CMD ["gunicorn", \
     "--workers", "4", \
     "--bind", "0.0.0.0:8080", \
     "--reload", "main:app", \
     "--timeout", "10000", \
     "--access-logfile", "-", \
     "--error-logfile", "-"]
