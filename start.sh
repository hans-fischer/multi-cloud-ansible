docker run -it \
    -v $(PWD):/root/packer \
    -v $(PWD)/results:/root/results \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
    -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
    -e AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION \
    provision_worker \
    bash

# packer build -only=amazon-ebs aws_m5a.2xlarge.json