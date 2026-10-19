FROM python:3.12-slim

RUN pip install complexipy==8.1.0

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
