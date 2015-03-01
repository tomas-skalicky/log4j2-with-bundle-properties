#!/usr/bin/env bash

tomcat_webapps=$1
war_file=$2

if [[ -z $tomcat_webapps ]]; then
    printf 'ERROR: Tomcat webapps folder needs to be passed\n'
    exit 1
fi
if [[ -z $war_file ]]; then
    printf 'ERROR: WAR filename needs to be passed\n'
    exit 1
fi


service tomcat8 stop

rm -rfv "$tomcat_webapps"/"$war_file" "$tomcat_webapps"/"${war_file%.war}"

service tomcat8 start
