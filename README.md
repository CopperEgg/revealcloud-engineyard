CopperEgg Cookbook for the Engine Yard Cloud
============================================

copperegg-engineyard
===========
* Chef cookbook for installing the CopperEgg collector agent on the Engine Yard Cloud.
* Requires a CopperEgg account to use. [Free trial available](https://app.copperegg.com/signup).

Requirements
============
bash

Platform
========
* This cookbook should only be used when deploying the CopperEgg collector on the Engine Yard Cloud.
* It was created in conformance with the Engine Yard documentation for Custom Chef Recipes, (see links below).

Attributes
==========
* `[:copperegg][:apikey]` = Your User API Key available from the [RevealCloud App Settings Page](https://app.copperegg.com/#settings/user).
* `[:copperegg][:tags]` = A comma separated list of tags to apply.  Optional.  [Manage your tags](https://app.copperegg.com/#revealcloud/tags).
* `[:copperegg][:label]` = Label to apply in place of hostname when displaying in the dashboard.  WARNING: If you want the same label applied to multiple systems, you may want to consider tags instead.  This is most useful if you intend a recipe for a single server.  Optional.
* `[:copperegg][:proxy]` = Proxy server required to talk to the revealcloud api servers, such as `myproxy.mycorp.com:8080`.  Optional.  Leave blank unless you know what you are doing.

Installation
============
1. Create your local chef repo as described in the document'Customize your environment', referenced above.
2. Download copperegg-engineyard into your local repo, for example, into ey-cloud-recipes/cookbooks/.
3. Add the following line to cookbooks/main/recipes/default.rb: `require_recipe "copperegg-engineyard"`
4. Edit `copperegg-engineyard/attributes/default.rb` and replace "Your User API Key".
5. Configure any other optional attributes as desired, and save the updated attributes/default.rb file.
6. Use the EY CLI command 'ey recipes upload -e nameofyourenvironment' to upload your changes to your environment
7. Use the EY CLI command 'ey recipes apply -e nameofyourenvironment' to cause engineyard to do a Chef run.
8. View your systems shortly thereafter in the [RevealCloud App](https://app.copperegg.com/#revealcloud/overview)

Links
=====
* [CopperEgg Homepage](http://www.copperegg.com)
* [RevealCloud Signup](https://app.copperegg.com/signup)
* [RevealCloud Login](https://app.copperegg.com/login)
* [Custom Chef recipes — examples & best practices](https://support.cloud.engineyard.com/entries/21406977-custom-chef-recipes-examples-best-practices)
* [Customize your environment with Chef recipes](https://support.cloud.engineyard.com/entries/21009867-custom-chef-recipes)

License and Author
==================
Author:: Ross Dickey

Copyright 2012, CopperEgg, Inc.

No License.  Redistribution encouraged.

