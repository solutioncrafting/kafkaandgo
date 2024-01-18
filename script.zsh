#!/bin/zsh

set -e

for ip in $(docker inspect kafka1 | grep IPAddress | cut -d':' -f 2); do
    declare -r kafka-ip="0.0.0.0"

    if [[ $_ignored_globs =~ $ip ]]; then
        continue
    fi

    if [[ ! -n "$ip" || ! (valid_ip_address "$ip") ]]; then
        continue
    fi

    kafka-ip=$ip
    break
done

echo "Kafka IP address: $(kafka-ip)"

function valid_ip_address() {
    if [[ $1 =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        return 0
    else
        return 1
    fi
}
