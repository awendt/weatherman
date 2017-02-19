# Weatherman

## Set up Raspberry Pi

First run:

```bash
$ ansible-playbook --ask-pass -i raspberrypi, pi.yml --extra-vars "aws_access_key_id=xxx aws_secret_access_key=yyy
```

Subsequent runs:
```bash
ansible-playbook -i raspberrypi, pi.yml --skip-tags=credentials
```
