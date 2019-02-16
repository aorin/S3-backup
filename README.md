# S3-backup

Simple bash-script for backupping a directory to a S3 bucket.

Instructions (for Ubuntu 16.04):

1. Install AWS CLI using python3 virtualenv and pip3
```sh
virtualenv -p python3 env
source env/bin/activate
pip3 install awscli --upgrade
```
2. Create and configure Amazon S3 bucket using the AWS console
    1. From the bucket properties tab enable versioning. Versioning makes it possible to recover old versions of the objects. It is needed because the script automatically updates all the changes to the S3 bucket even the unwanted ones
    2. From the bucket management tab add a lifecycle rule. With S3 lifecycling it is possible to tell S3 when to transition objects to another storage class or delete them permanently. It is a good idea to transition all the previous versions first to the Amazon Glacier storage class which is made for archieving and then delete them permanently after enough days have passed.
4. Set the S3 bucket name and the directory path to the config.sh
5. Add execution rights to the S3-backup.sh file
```sh
chmod +x S3-backup.sh
```
6. Set cron to execute the script periodically. Use command
```sh
crontab -e
```
to edit the crontab. Add for example a task
```sh
0 * * * * {path to the script}/backup-S3.sh > {path to the script}/backup.log
```
which runs the backup script every hour and writes output to a logfile
