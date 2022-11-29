#!/bin/bash

declare -a services=(
    "azuracast"
    "caddy"
    "elixire"
    "gitea"
    "mailcow"
    "nextcloud"
    "ntfy"
    "stub"
    "umami"
    "vaultwarden"
    "watchtower"
)

for i in "${!services[@]}"
do
    [[ -d ./files/data/${services[$i]} ]] && echo "Moving ${services[$i]} Data"
    [[ -d ./files/data/${services[$i]} ]] && cp ./files/data/${services[$i]}/* ./${services[$i]}
    [[ -e ./files/envs/.${services[$i]}.env ]] && echo "Moving ${services[$i]} Env"
    [[ -e ./files/envs/.${services[$i]}.env ]] && cp ./files/envs/.${services[$i]}.env ./${services[$i]}/.env
done