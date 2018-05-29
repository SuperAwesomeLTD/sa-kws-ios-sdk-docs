BRANCH="$1"

if [ $1 = "develop" ]; then
    aws --region=us-west-1 s3 sync "build/html/" s3://doc.staging.superawesome.tv/sa-kws-ios-sdk/
else
    aws --region=us-west-1 s3 sync "build/html/" s3://doc.superawesome.tv/sa-kws-ios-sdk/
    aws cloudfront create-invalidation --distribution-id E3HBU8LMG9T4OL --invalidation-batch "{ \"Paths\": { \"Quantity\": 1, \"Items\": [ \"/*\" ] }, \"CallerReference\": \"$(date +%s)\" }"
fi
