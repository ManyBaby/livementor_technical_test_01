# LiveMentor - Technical Test #1

## Thought process

First I need to identify the concerns so I can make the code modular and extandable.
The lib must:

- load JSON files
- parse the JSON object to a ruby one
- flatten the deep nested ruby object with dot separated keys
- transform any array of string to a comma separated value (escaping the commas)
- extract the keys from the flat ruby object to set the headers of the csv
- convert each element of the flat ruby object to a csv line
- output CSV

I think that I can split those into 3 major concerns :
- everything that is JSON related
- everything that is related to transforming the ruby object to a flat one
- everything that is CSV related

I believe that the goal is clear enough to TDD.
So let's start with JSON!
Done !

Now we have something to load JSON file into ruby let's transform it to what we want: a flat ruby object.
The deeply nested structure of the newly created ruby object must require some recursion and since I'm not the best at it I googled and found [something pretty close to what we want on StackOveflow](https://stackoverflow.com/questions/23521230/flattening-nested-hash-to-a-single-hash-with-ruby-rails).
Awesome ! Let's implement it.