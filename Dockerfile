FROM python:3.12-slim

RUN pip install complexipy==3.1.0

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
