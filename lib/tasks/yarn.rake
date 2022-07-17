# Heroku problem https://github.com/rails/rails/issues/43906

Rake::Task["assets:precompile"].enhance ["yarn:install"]
