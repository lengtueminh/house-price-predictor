FROM python:3.11-slim 

WORKDIR /app 

COPY src/api/ .

RUN pip install --no-cache-dir --default-timeout=1000 \
    -i https://pypi.tuna.tsinghua.edu.cn/simple \
    -r requirements.txt

COPY models/trained/*.pkl models/trained/

EXPOSE 8100 8000

CMD [ "uvicorn",  "main:app",  "--host",  "0.0.0.0",  "--port",  "8000" ]

