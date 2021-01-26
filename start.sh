docker run -it \
    -v $(PWD):/root/packer \
    -v $(PWD)/results:/root/results \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
    -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
    -e AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION \
    -e GOOGLE_APPLICATION_CREDENTIALS="/root/packer/local_google_compute_service_account.json" \
    -e AZURE_CLIENT_ID=$AZURE_CLIENT_ID \
    -e AZURE_CLIENT_SECRET=$AZURE_CLIENT_SECRET \
    -e AZURE_TENANT_ID=$AZURE_TENANT_ID \
    -e AZURE_SUBSCRIPTION_ID=$AZURE_SUBSCRIPTION_ID \
    provision_worker \
    bash
