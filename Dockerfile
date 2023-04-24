FROM python:3.10.6-slim as builder
ENV PYTHONUNBUFFERED=1

RUN pip install -U pip setuptools wheel

WORKDIR /wheels
COPY requirements.txt /requirements.txt
RUN pip wheel -r /requirements.txt


FROM python:3.10.6-slim
ENV PYTHONUNBUFFERED=1

COPY --from=builder /wheels /wheels
RUN pip install -U pip setuptools wheel \
      && pip install /wheels/* \
      && rm -rf /wheels \
      && rm -rf /root/.cache/pip/*

WORKDIR /usr/src/app
COPY src/ .
COPY docker/ ./docker

EXPOSE 8000
ENV PYTHONPATH /usr/src/app

RUN python manage.py collectstatic --noinput

CMD ["gunicorn", "-c", "docker/gunicorn.py", "config.wsgi:application"]
