# DeviseCouch for Devise and CouchrestModel

*devise_couch* will let you use [devise](http://github.com/plataformatec/devise) with [CocuhrestModel](http://github.com/couchrest/couchrest_model). 

*devise_couch* is intended for use with *Rails 3* and *Devise 1.1.1*. It may work with earlier versions of devise, but it's not been tested.

This README only covers *devise_couch* specifics. Make sure to read the [devise README](http://github.com/plataformatec/devise/blob/master/README.rdoc)

## Usage options

The gem gives you the options of 2 ORM setups depending on what library you wish to use for validations:   

* *couchrest_model* - Uses CocuhrestModel validations 
* *couchrest_model_active_model* - Uses ActiveModel::Validations

The advantage to this is ActiveModel's I18n support for error messages, and it uses the same validations lib as devise does by default.

## ActiveModel compatibility 

Currently only the <code>couchrest_model</code> option has been tested. 
There should be full ActiveModel support in a future version of CocuhrestModel, after Rails 3 is released.
ActiveModel support will likely be part of *CocuhrestModel 1.0* (as mentioned by jnunemaker in a post).

## Installation

Add *devise*, *devise_couch* and *couchrest_model* gems to your Gemfile (your Rails app Gemfile). The following gems are required

<pre>
  gem 'couchrest'
  gem 'couchrest_extended_document'
  gem 'couchrest_model'
  gem 'devise'
  gem 'devise_couch'
  gem 'rails3-generators', :git => 'git://github.com/shenoudab/rails3-generators.git'
</pre>

<pre>gem install rails3-generators</pre>
  
Alternatively use bundler to install all required gems in your Rails 3 app 

<pre>bundle install</pre>

Run the generator:

<pre>rails generate devise:install</pre>

The generator will install an initializer which describes ALL Devise's
configuration options and you MUST take a look at it. Make sure to specify
either <code>mongo_mapper</code> or <code>mongo_mapper_active_model</code> (ActiveModel::Validations) 
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
