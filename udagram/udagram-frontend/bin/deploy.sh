aws s3 cp --recursive --acl s3://egfwd-t3-november-22-udagram/
aws s3 cp --acl public-read --cache-control="max-age=0, no-cache, no-store, must-revalidate" ./www s3://egfwd-t3-november-22-udagram/