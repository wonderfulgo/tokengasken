#!/bin/bash                                                                             
red="\e[1;31m"                                                                          
green="\e[0;32m"                                                                        
NC="\e[0m"                                                                              

status="$(systemctl status xray@none --no-page)"                                   
status_text=$(echo "${status}" | grep 'contains' | cut -d ' ' -f 11)                     
if [ "${status_text}" == "contains" ]                                                     
then                                                                                    
systemctl restart xray@none      
fi
