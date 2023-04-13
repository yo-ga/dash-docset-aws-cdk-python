#!/bin/bash

set -e
resp=$(curl -s https://api.github.com/repos/aws/aws-cdk/releases/latest)
tag=$(echo $resp | jq -r '.tag_name' )
wget "https://github.com/aws/aws-cdk/releases/download/${tag}/aws-cdk-python-docs-${tag:1}.zip" -O ../doc.zip
mkdir ../export
unzip ../doc.zip -d ../export

find ../export/ -type f -name '*.html' | xargs sed -i '/awsdocs-boot.js/d'
cat ./static/specific.css >> ../export/_static/css/custom.css

pip3 install -r requirements.txt
doc2dash -n "AWS CDK Python" -I index.html -j -u "https://docs.aws.amazon.com/cdk/api/v2/python/" ../export
mv ./AWS\ CDK\ Python.docset/ ./AWS_CDK_Python.docset/
cp ./static/icon.png ./AWS_CDK_Python.docset/
cp ./static/icon@2x.png ./AWS_CDK_Python.docset/
ls .

tar --exclude='.DS_Store' -cvzf AWS_CDK_Python.tgz AWS_CDK_Python.docset
