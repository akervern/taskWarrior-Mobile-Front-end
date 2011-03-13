# TaskWarrior Mobile front-end 

A Sinatra / JQuery Mobile based apps to manage taskWarrior data

## Building

First, you need to make sure you have:

- Ruby 
- Rake
- RSpec
- Sinatra
- Thin
- TaskWarrior

If something is missing, you can install it with Gem.

    $ gem install rake rspec sinatra thin

Launch Sinatra in dev mode 

    $ rake

Execute test

    $ rake test

Execute test in doc mode

    $ rake doc

Launch daemon using Thin, you need to have a config.ru file and a config.yml. (refer to *.example)

    $ rake start

Stop daemon if stated

    $ rake stop

## TaskWarrior

Taskwarrior is an ambitious project to supercharge task with an interactive interface, GTD features, color themes, data synch, dependencies, custom reports, charts, and Lua plugins, all while our international team provides excellent support!

More information on: <http://taskwarrior.org/>
