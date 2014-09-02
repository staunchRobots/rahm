# Events extension for Refinery CMS.

##Run all the extension test 
<pre><code>bundle exec rspec </code></pre>

## How to build this extension as a gem (not required)

    cd vendor/extensions/events
    gem build refinerycms-events.gemspec
    gem install refinerycms-events.gem

    # Sign up for a http://rubygems.org/ account and publish the gem
    gem push refinerycms-events.gem
