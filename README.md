# Weatherman

I do [temperature monitoring](http://docs.gadgetkeeper.com/pages/viewpage.action?pageId=7700673) using my Raspberry Pi.
These are the scripts to set everything up.

## Assumptions

1. The Pi has [Raspbian](https://www.raspberrypi.org/downloads/raspbian/) installed and you have SSH access.
2. You have [Ansible](https://www.ansible.com/) installed on your local machine:

   ```
   $ brew install ansible
   ```
3. You have an AWS account
4. In AWS, there's an IAM user who has the following permission:

   ```json
    {
      "Version": "2012-10-17",
      "Statement": [{
        "Effect": "Allow",
        "Action": [
          "cloudwatch:PutMetricData"
        ],
        "Resource": ["*"]
      }]
    }
   ```
5. The IAM user has access credentials

## What to do

First run:

```bash
$ ansible-playbook --ask-pass -i raspberrypi, pi.yml --extra-vars "aws_access_key_id=xxx aws_secret_access_key=yyy room=bedroom"
```

Subsequent runs:
```bash
ansible-playbook -i raspberrypi, pi.yml --skip-tags=credentials
```

## What this does

- compiles the library to read temperature and humidity from the sensor
- reads data from the sensor and outputs it as JSON
- JSON is fed into the [AWS Command-line interface](https://aws.amazon.com/cli/) which sends data to AWS CloudWatch
- adds a crontab entry to do all this every 5 minutes
