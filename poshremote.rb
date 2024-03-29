#!/usr/bin/env ruby

# This is a simple little WinRM/Powershell remoting script
# heavily influenced by the examples from the WinRM module
# developers.
#
# WinRM devloper: Shawn Neal <sneal@sneal.net>
#
# This simple script created by:
#                       m3lodicmin0r
#                       (Aka Stephen Garrison)
require 'winrm'
destination = ARGV[0]
username = ARGV[1]
pass = ARGV[2]
poshcommand = ARGV[3]

halpz = "poshremote usage: <http://HOST> <USERNAME> <PASS> <POWERSHELL COMMAND>"


if destination == "-h"
        puts halpz
elsif destination == "--help"
        puts halpz
else

    opts = { 
      endpoint: "http://" + destination + ":5985/wsman",
      user: username,
      password: pass
    }
    conn = WinRM::Connection.new(opts)
    conn.shell(:powershell) do |shell|
      output = shell.run(poshcommand) do |stdout, stderr|
        STDOUT.print stdout
        STDERR.print stderr
      end
    puts "The script exited with exit code #{output.exitcode}"
  end
end
