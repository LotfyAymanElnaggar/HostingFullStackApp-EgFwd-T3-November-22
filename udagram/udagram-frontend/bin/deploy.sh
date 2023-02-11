aws s3 rm --recursive s3://plaplapla/
aws s3 cp --recursive --acl public-read ./www s3://plaplapla/



# aws s3api create-bucket \
#     --bucket plaplapla \
#     --region us-east-1
# aws s3 cp --recursive ./www s3://egfwd-t3-november-22-udagram
# aws s3 cp --acl public-read --cache-control="max-age=0, no-cache, no-store, must-revalidate" ./www/index.html s3://egfwd-t3-november-22-udagram