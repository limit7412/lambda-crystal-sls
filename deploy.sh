stg=$1
[ -n $stg ] && stg="dev"

ls $(pwd)/src/ |
while read line; do
  $(pwd)/build.sh $line
done &&
sls deploy -s $stg