#!/bin/bash

sleep 1

cd /srv/unturned

steamcmd +@sSteamCmdForcePlatformBitness 64 +force_install_dir /srv/unturned +login anonymous +app_update 1110390 +quit
curl -s https://api.github.com/repos/openmod/OpenMod/releases/latest | jq -r ".assets[] | select(.name | contains(\"OpenMod.Unturned.Module\")) | .browser_download_url" | wget -i -
unzip -o -q OpenMod.Unturned.Module*.zip -d Modules && rm OpenMod.Unturned.Module*.zip
cp -r Extras/Rocket.Unturned Modules/

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/srv/unturned/linux64/

./Unturned_Headless.x86_64 -batchmode -nographics +InternetServer/a