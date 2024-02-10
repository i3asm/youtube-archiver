FROM python:3.12-slim

# Install dependencies
RUN apt-get update && \
    apt-get install -y ffmpeg cron && \
    pip install --upgrade yt-dlp

# Setup cron job
COPY crontab /etc/cron.d/youtube-dl-cron
RUN chmod 0644 /etc/cron.d/youtube-dl-cron && \
    crontab /etc/cron.d/youtube-dl-cron && \
    touch /var/log/cron.log

# Your app setup
WORKDIR /app
COPY ./requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt
COPY . /app

COPY start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]

