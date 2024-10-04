clear
read -p "Enter domain name: " domainName

echo ""
printf 'create site folders '$domainName'  (y/n)? '
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then 
    echo "--- create " $domainName " site"

    mkdir -p /var/www/$domainName/website/www
    mkdir -p /var/www/$domainName/website/logs
    mkdir -p /var/www/$domainName/subdomains
    mkdir -p /var/www/$domainName/website/subdomains/logs

    echo "--- site " $domainName " completed"
else
    echo "--- site " $domainName " canceled!!"
fi

