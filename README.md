# PoSHRemote
A nifty little WinRM/Powershell Remoting client!

## Requirements:
ruby version 2.5.7+ (Tested with 2.5.7p206, may work with older version)
winrm ruby library found [here](https://github.com/WinRb/WinRM)

### To install the winrm library:

```shell
gem install -r winrm
```

### Usage:
Example:
```shell
poshremote 10.10.10.13 administrator P@ssword! $PSVersionTable
```
#### NOTE 1:
When using the script with long commands/semicolon delimited one-liners, use single quotes (') to wrap the entire command (I've found that works best)

#### NOTE 2:
This script defaults the winrm port to 5985 and the path is set by default to /wsman
