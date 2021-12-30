volA="$(aws ec2 describe-volumes --region us-east-2 --filters Name=attachment.instance-id,Values= | awk '/vol-\w+/{print $2; exit}' | awk '{sub(",","",$0);print}' | awk '{gsub("\"","",$0); print}')"
volB="$(aws ec2 describe-volumes --region us-east-2 --filters Name=attachment.instance-id,Values= | awk '/vol-\w+/{print $2; exit}' | awk '{sub(",","",$0);print}' | awk '{gsub("\"","",$0); print}')"
aws ec2 create-snapshot --volume-id ${volA}  --description "Making Backup before deployment at $(date)" | awk '/SnapshotId/{print $2}' | awk '{sub(",","",$0);print}' | awk '{gsub("\"","",$0); print}'
aws ec2 create-snapshot --volume-id ${volB}  --description "Making Backup before deployment at $(date)" | awk '/SnapshotId/{print $2}' | awk '{sub(",","",$0);print}' | awk '{gsub("\"","",$0); print}'
