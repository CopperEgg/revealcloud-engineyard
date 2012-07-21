#
# Cookbook Name:: copperegg-chef
# Recipe:: default
#
# Copyright 2012, CopperEgg
#

# Your user api key, found on this page:
# https://app.copperegg.com/#settings/user
# REQUIRED.  Revealcloud will not work without this attribute.
copperegg :apikey => "tWMAHbPIpqItwTkk",

# Comma and/or space separated list of tags to apply.  Useful for grouping systems.
# Tags are managed here:  https://app.copperegg.com/#revealcloud/tags
# Any nonexistant tags specified here will be created.
# Note: Tags may not have spaces. A space between two words will cause
#   the words to be treated as two separate tags.
# Note: Any tags already applied to a server being monitored will remain.
#   Setting tags here will only add tags.
# Optional.  This field may be left blank.
# Example: "devserver"
# Example: "database,replica,production"
:tags => "engineyard,testing",

# Label to apply to this system.  Only one may be specified.
# WARNING: labels are used in place of hostname.
#   Use only if this recipe is deployed to a single server,
#   or you desire multiple servers to have the same label
#   in the Dashboard and Alerts.
#   If this is not your desire, you may want to use a tag instead.
# Note: Do not include spaces in your label.
# Note: Leaving blank will not remove a label that is already set on a monitored system.
# Optional.  This field may be left blank.
# Example: "MySQL_Master"
:label => "",

# Proxy to use to connect to revealcloud api from monitored server.
# Most users should leave this blank unless they know they need it.
# Optional.  This field may be left blank.
# Example: myproxy.mycorp.com:8080
:proxy => "",

# Flag for determining if the Linux Out Of Memory manager (OOM) should be allowed
# to kill the RevealCloud process.  Can be overridden at the node level.
# true  => OOM protection Enabled; can NOT be killed by OOM.  Agent will be started with -O.
# false => OOM protection disabled; CAN be killed by oom.  Default.  Recommended.
:oom_protect => false,

# This field is provided for the rare case where you want to override the default UUID 
# provided by the underlying platform.
# if non-zero => the contents of this string will be passed to the copperegg collector.
# 	NOTE: be careful ... you should never pass the same UUID to more than one system!
# if zero => Use the default system UUID. Recommended.
:override_uuid => false





