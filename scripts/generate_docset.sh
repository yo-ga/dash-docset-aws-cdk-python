#!/bin/bash

set +e
resp=$(curl -s https://api.github.com/repos/aws/aws-cdk/releases/latest)
tag=$(echo $resp | jq -r '.tag_name' )
wget "https://github.com/aws/aws-cdk/releases/download/${tag}/aws-cdk-python-docs-${tag:1}.zip" -O ../doc.zip
wget "https://github.com/aws/aws-cdk/releases/download/${tag}/aws-cdk-python-docs-${tag:1}.zip.sig" -O ../doc.zip.sig
gpg --verify ../doc.zip.sig ../doc.zip
mkdir ../export
unzip ../doc.zip -d ../export
echo ./static/specific.css >> ../export/_static/css/custom.css

pip3 install -r requirements.txt
doc2dash -n "AWS_CDK_Python" -I index.html -j -u "https://docs.aws.amazon.com/cdk/api/v2/python/" ../export
cp ./static/icon.png ./AWS_CDK_Python.docset/
cp ./static/icon@2x.png ./AWS_CDK_Python.docset/
ls .
