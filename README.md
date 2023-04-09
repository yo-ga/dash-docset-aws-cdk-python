# dash-docset-aws-cdk-python
> This repository is inspired by [roberth-k/dash-docset-aws-cdk](https://github.com/roberth-k/dash-docset-aws-cdk)

## Overview

[*AWS CDK*](https://docs.aws.amazon.com/cdk/v2/guide/home.html) Python docset for the [*Dash*](https://kapeli.com/dash) documentation browser.

Generate from [aws/aws-cdk](https://github.com/aws/aws-cdk) release Python document assets, as same as [AWS CDK Python Reference](https://docs.aws.amazon.com/cdk/api/v2/python/).

The official version of AWS CDK Python documentation is hosted [here](https://docs.aws.amazon.com/cdk/api/v2/python/).

*The maintainer of this repository is not affiliated with AWS.*

## How to built in local

### environment requirements
- bash
- curl
- wget
- tar
- zip
- jq
- Python 3

### build

```sh
$ git clone https://github.com/yo-ga/dash-docset-aws-cdk-python
$ cd dash-docset-aws-cdk-python
$ pip3 install -r requirements.txt
$ bash ./scripts/generate_docset.sh
```
