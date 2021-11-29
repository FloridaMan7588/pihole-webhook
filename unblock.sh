. ./services.conf

if [ $use_docker = false ]; then
    if [ $enable_regex = false ]; then
        pihole -b -d $domains
    else
        pihole -b -d $domains
        pihole --regex -d $expressions
    fi
else
    if [ $enable_regex = false ]; then
        docker exec $container_name pihole -b -d $domains
    else
        docker exec $container_name pihole -b -d $domains
        docker exec $container_name pihole --regex -d $expressions
    fi
fi