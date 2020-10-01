# allaws
## Run AWS CLI on all available regions
AWS CLI executes the vast majority of commands on a single region. However, it is often beneficial to run a command on ALL AWS regions. 
For example, I may want to get a list of ALL CloudFormation stacks running, all EC2 instances, all SSH keys, or all Lambda layers. 

The allaws tool has 2 scripts, one for windows and one for linux. 
## Usage
First, you need to have an AWS CLI command to execute. For example, list the CloudFormation stacks

`aws cloudformation list-stacks --query "Stacks[*]."StackName"`

Now all you have to do is add `all` before your command, and make it 

`allaws cloudformation list-stacks --query "Stacks[*]."StackName"`

## Installation on Windows
Just put the allaws.bat file somewhere in your path.

## Installation on Linux
Just put the allaws.bat file somewhere in your path. /usr/local/bin worked for me. 

Then add this to your .bashrc
`alias allaws="allaws.sh`

## Caveats
This command uses the ec2 describe-regions command. While this is good enough for most purposes, it is not always accurate, as some AWS services are not available in all regions. 
Still, at most you will get an empty response :/
