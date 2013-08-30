# Generating a Sinatra site from a model

Sample that generates a Sinatra site, from a model.

## Generate the code

Execute

```
ruby generate.rb
```

This command creates a directory `build` where the generated site resides

## Run the application

From this document directory, run

```
ruby -I./build build/app.rb
```

You need to install Sinatra. Usually, run

```
gem install sinatra
```

to have a global installation



