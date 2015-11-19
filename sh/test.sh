#!/bin/bash
sudo tac /var/log/httpd/access_log > log.txt

regex="(POST|GET) /index.php/twitter/(register|login|homepage)"
file="log.txt"

day=$(date +"%d")
date=$(date +"%d/%b/%Y")

while IFS= read -r line 
do
    if [[ $line != *"$day"* ]]
    then
        break
    fi

    if [[ $line =~ $regex  ]]
    then
        let ${BASH_REMATCH[1]}_${BASH_REMATCH[2]}+=1
        let count=${BASH_REMATCH[1]}_${BASH_REMATCH[2]}
        grep -v "${BASH_REMATCH[1]}_${BASH_REMATCH[2]}" test.txt > tmp.txt
        mv tmp.txt test.txt
        echo ${BASH_REMATCH[1]}_${BASH_REMATCH[2]} $count >> test.txt
    fi
done < "$file"

sort test.txt | mail -s "{log}$date" manh@realworld.jp
echo "Mail sent"
rm log.txt test.txt
