@echo off
setlocal enableextensions 

set AWSCOMMAND=%*

rem fetch regions list 
for /f "tokens=*" %%r in (
	'@call aws ec2 describe-regions --filters "Name=opt-in-status,Values=opt-in-not-required,opted-in" --no-all-regions --query "Regions[*].RegionName" --output text'
	) do ( 
	set REGIONS=%%r 
) 
  
rem execute command for all regions
for %%R in (%REGIONS%) do (
	echo Region %%R
	@call aws %AWSCOMMAND% --region %%R
)	
