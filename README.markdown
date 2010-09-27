# DeviseCouch for Devise and CouchrestModel

*devise_couch* will let you use [devise](http://github.com/plataformatec/devise) with [CocuhrestModel](http://github.com/couchrest/couchrest_model). 

## Installation

Add *devise*, *devise_couch* and *couchrest_model* gems to your Gemfile (your Rails app Gemfile). The following gems are required

<pre>
  gem 'couchrest_model'
  gem 'devise'
  gem 'devise_couch'
  gem 'rails3-generators', :git => 'git://github.com/shenoudab/rails3-generators.git'
</pre>
  
Use bundler to install all required gems in your Rails 3 app 

<pre>bundle install</pre>

Run the generator:

<pre>rails generate devise:install</pre>

The generator will install an initializer which describes ALL Devise's
configuration options and you MUST take a look at it. Make sure to specify
either <code>couchrest_model</code> (ActiveModel::Validations) 
as the orm in the configuration file.

To add Devise to any of your models using the generator:

<pre>rails generate couchrest_model:devise MODEL</pre>  

Example: create a User model for use with Devise  

<pre>rails generate couchrest_model:devise User</pre>

Read the README for devise at [devise README](http://github.com/plataformatec/devise/blob/master/README.rdoc)

## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Thanks

*Kristian Mandrup* -  - Created the mm-devise gem which was used as a template for the development of this gem.
Also made suggestions for a few critical fixes and improvements in the code. Thanks :)

*Jared Morgan* - Created the dm-devise gem which was used as a template for the development of this gem.
Also made suggestions for a few critical fixes and improvements in the code. Thanks :)

## Bugs and Feedback

For *devise_couch* specific issues, please create an issue on GitHub at: [devise_couch issues](http://github.com/shenoudab/devise_couch/issues)

## Copyright

Copyright (c) 2010 Shenouda Bertel MobiThought. See LICENSE for details.
