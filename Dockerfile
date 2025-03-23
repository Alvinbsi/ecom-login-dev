FROM python:3.9
WORKDIR /app
COPY ./requirments.txt /app/requirments.txt
RUN pip install --no-cache-dir --upgrade -r /app/requirments.txt
COPY ./main.py /app/main.py
COPY ./form.html /app./form.html
ENTRYPOINT  ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]







