stg=$1
[ "$stg" = "" ] && stg="dev"

ls $(pwd)/src/ |
while read line; do
  $(pwd)/build.sh $line || exit 1
done &&
sls deploy -s $stg
