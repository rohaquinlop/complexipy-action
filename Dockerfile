FROM python:3.12-slim

RUN pip install complexipy==8.0.1

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
