## ec2ppuku

`upstart` service for EC2 instances that shuts down the instance if any
disk exceeds a dangerous level of disk usage. Defaults to 90% used space.

## Requirements

- upstart
- `Ec2ppukuLimit=<number>` optional env var with the maximum amount of
  used disk space allowed before an EC2 will shut down. Defaults to 90.

## Install

`./install.bash`

