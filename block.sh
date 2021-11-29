. ./services.conf

if [ $use_docker = false ]; then
    if [ $enable_regex = false ]; then
            pihole -b $domains
    else
        pihole -b $domains
        pihole --regex $expressions
    fi
else
    if [ $enable_regex = false ]; then
        docker exec $container_name pihole -b $domains
    else
        docker exec $container_name pihole -b $domains
        docker exec $container_name pihole --regex $expressions
    fi
fi