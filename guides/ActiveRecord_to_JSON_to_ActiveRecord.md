## ActiveRecord > JSON > ActiveRecord




### All the Things to .json file

```ruby
things = Thing.all
json_things = things.to_json except: [:id, :created_at, :updated_at]
File.write('path/to/file.json', json_things)
```

or, chain it:

```ruby
File.write('path/to/file.json', Thing.all.to_json(except: [:id, :created_at, :updated_at]))
```



### Things in a .json file to ActiveRecord

```ruby
json_things = File.read('path/to/file.json')
things = JSON.parse(json_things)
things.each { |thing| Thing.create(thing.to_h) }
```

or, chain it:

```ruby

JSON.parse(File.read('path/to/file.json')).each { |thing| Thing.create(thing.to_h) }
```

