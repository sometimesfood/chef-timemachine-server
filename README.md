chef-timemachine-server
=======================

chef-timemachine-server is a [Chef](http://www.opscode.com/chef/)
cookbook that turns a GNU/Linux box into a full-fledged Time Machine
server for OS X clients using Netatalk and Avahi.

Documentation
-------------

Just add timemachine-server to your runlist and define a Time Machine
user and directory:

    {
      "timemachine_server": {
        "timemachine_user_homedirs": {
          "timelord": "/mnt/timemachine"
        }
      },
      "run_list": [ "recipe[timemachine-server]" ]
    }

Copyright
---------

Copyright (c) 2012 Sebastian Boehm. See LICENSE for details.
