# multi-cloud-ansible
This repo is about to provision vm's in most major clouds

Commands to benchmark seperate cloud worker

Run on AWS
```
$ packer build -only=amazon-ebs multi-cloud-benchmark.json
```

Run on Google Compute Cloud
```
$ packer build -only=googlecompute multi-cloud-benchmark.json
```

Run on Microsoft Azure
```
$ packer build -only=azure-arm multi-cloud-benchmark.json
```