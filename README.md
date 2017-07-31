# Rails starter kit

## Create new project
```
rails new blog --database=postgresql --skip-test --skip-coffee --template=https://kits.castle.co/rails.rb
```

## Change `template.rb`

After you've made changes to `template.rb` apply this changes to current project before commiting:

```
DEBUG=yes bin/rails app:template LOCATION=./template.rb
bundle install
```

