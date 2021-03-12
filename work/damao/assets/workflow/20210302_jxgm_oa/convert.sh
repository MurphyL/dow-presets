awk '{gsub(/;/, ""); print $NF }' $1 > $1.x

# if (NR%2==0){print "####" $NF } else {printf("%s", $NF)}
