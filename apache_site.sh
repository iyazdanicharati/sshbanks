clear
read -p "Enter domain: " domain 
read -p "Enter domain name: " domainName
read -p "Enter domain path: " domainPath
read -p "Enter logs path: " domainLogs
echo ""
printf 'create apache site '$domain' @ '$domainName' in '$domainPath' (y/n)? '
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then 
    echo "--- create " $domain " apache site"

    echo "<VirtualHost *:80>
        ServerName $domainName
        ServerAlias $domain
        ServerAdmin iyazdanicharati@gmail.com
        DocumentRoot /var/www/$domainPath

        ErrorLog /var/www/$domainLogs/error.log
        CustomLog /var/www/$domainLogs/access.log combined
        <Directory /var/www/$domainPath>
           Options Indexes FollowSymLinks
           AllowOverride All
           Require all granted
        </Directory>

    </VirtualHost> #generated by iyc@iclassic" >> $domain.conf

    sudo mv $domain.conf /etc/apache2/sites-available/

    sudo a2ensite $domain.conf
    echo "--- " $domain " apache enabled"

    sudo systemctl reload apache2
    echo "--- " $domain " apache restarted"

    echo "--- apache " $domain " completed"
else
    echo "--- apache " $domain " canceled!!"
fi

