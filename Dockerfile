FROM alpine:3.14

RUN apk add py3-pip \
    && pip install --upgrade pip

RUN addgroup -S appgroup -g 10001 && adduser -S -D -H -u 10001 -G appgroup appuser

WORKDIR /app
COPY --chown=appuser:appgroup . /app/
    
RUN pip install -r requirements.txt

EXPOSE 5000

CMD ["python3", "src/application.py"]

RUN pip install newrelic

USER appuser

ENTRYPOINT ["newrelic-admin", "run-program"]