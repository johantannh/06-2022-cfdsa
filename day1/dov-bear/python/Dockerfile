FROM python:3.10-alpine3.16

LABEL org.opencontainers.image.source=https://github.com/johantannh/06-2022-cfdsa

# Install curl
RUN apk update && apk add curl

ADD . .

RUN pip install -r requirements.txt

###### Executing/Running the image
ENV PORT=3000

EXPOSE ${PORT}

HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
    CMD curl -s http://localhost:${PORT}/healthz || exit 1

# Run app
ENTRYPOINT ["ash", "run.sh"]