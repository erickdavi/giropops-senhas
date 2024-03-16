FROM python:3.11
WORKDIR /app
COPY requirements.txt .
COPY app.py .
COPY templates templates/
COPY static static
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --upgrade Flask
EXPOSE 5000
CMD ["flask", "run", "--host=0.0.0.0"]
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD  status=$(curl -sI localhost:5000 | awk '/HTTP/{print $2}'); test $status -eq 200 || exit 1