FROM ubuntu:18.04

# Shift timezone to Asia/Tokyo.
RUN apt-get update -y && apt install -y tzdata && apt-get install -y emacs && apt-get clean && rm -rf /var/lib/apt/lists/*
ENV TZ 'Asia/Tokyo'

COPY assets /assets
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && /assets/setup.sh && chmod 777 /assets/recreate.sh && su oracle -c '/assets/recreate.sh' && rm -r /assets/

EXPOSE 22
EXPOSE 1521
EXPOSE 8080

CMD /usr/sbin/startup.sh && tail -f /dev/null
