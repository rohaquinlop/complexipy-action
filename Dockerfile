FROM python:3.12-slim

RUN pip install complexipy==main

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
