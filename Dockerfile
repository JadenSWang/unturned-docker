FROM steamcmd/steamcmd:ubuntu-22

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get full-upgrade -y \
    && apt-get install -y curl wget jq screen htop unzip lib32stdc++6 libc6 libgdiplus libgl1-mesa-glx libxcursor1 libxrandr2 libc6-dev \
    && mkdir -p /srv/unturned/Unturned_Headless_Data/Plugins/x86_64 /srv/unturned/.steam/root /srv/unturned/.steam/steam \
    && ln -s /usr/lib/x86_64-linux-gnu/libdl.so.2 /usr/lib/x86_64-linux-gnu/libdl.so

WORKDIR /srv/unturned

ENV DEBIAN_FRONTEND ""

COPY ./entrypoint.sh entrypoint.sh
ENTRYPOINT ["/bin/bash", "entrypoint.sh"]
