#!/bin/bash
project_path=$(dirname "$0")
source $project_path/config.sh
$project_path/env/bin/aws s3 sync $directory s3://$bucket_name
