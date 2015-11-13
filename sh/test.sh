#!/bin/bash
start_time=$(date +%s)
check_time=$(date -d "23:59:59" +%s)
sleep_time=$(( $check_time - $start_time ))
sleep $sleep_time

while :
do  
    sudo tac /var/log/httpd/access_log > log.txt
    file="log.txt"
    time=$(date +"%T")
    if [ $time == "23:59:59" ]
    then
        get_login=0
        post_login=0
        get_register=0
        post_register=0
        get_homepage=0
        post_homepage=0
        day=$(date +"%d")
        date=$(date +"%d/%b/%Y")
        while IFS= read -r line 
        do
            if [[ $line != *"$day"* ]]
            then
                break
            fi

            case "$line" in
                *GET*login*) 
                    get_login=$($get_login + 1)
                            ;;
                    *POST*login*)
                    post_login=$($post_login + 1)
                    ;;
                        *GET*register*)
                    get_register=$($get_register + 1)
                    ;;
                        *POST*register*)
                    post_register=$($post_register + 1)
                    ;;
                *GET*homepage*)
                    get_homepage=$($get_homepage + 1)
                    ;;
                *POST*homepage*)
                    post_homepage=$($post_homepage + 1)
                    ;;
                esac
        done < "$file"        
        echo -e "login[method:GET] $get_login\nlogin[method:POST] $post_login\nregister[method:GET] $get_register\nregister[method:POST] $post_register\nhomepage[method:GET] $get_homepage\nhomepage[method:POST] $post_homepage" | mail -s "{log}$date" manh@realworld.jp
    echo "Mail sent"
    rm log.txt
        sleep 24h
    fi
done