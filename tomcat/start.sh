cd /usr/local/tomcat
dir=webapps.dist

if [ -d "$dir" ]; then
    echo "Restoring original webapps tomcat folder"
    rm -rf webapps
    mv $dir webapps

    echo "Deploying war"
    cp /tmp/oaw.war webapps
fi

catalina.sh run
