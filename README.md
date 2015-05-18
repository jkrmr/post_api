PostApi
=======

Installation
------------

```sh
$ bin/rake db:setup
```

Spec suite
-----------

```sh
$ bin/rspec --format=documentation
```

Manual testing
--------------

```sh
# (for convenience)
$ alias json='curl -H accept:application/json'
```

### Listing (10) most recent posts

```sh
$ json -X GET http://localhost:3000/v1/posts/
```

### Listing a particular post

```sh
$ json -X GET http://localhost:3000/v1/posts/1
```

### Listing comments for a post

```sh
$ json -X GET http://localhost:3000/v1/posts/1/comments
```

### Adding a nested comment to a post

```sh
$ json -X POST http://localhost:3000/v1/posts/20/comments -d 'comment[content]="child comment"&comment[user_id]=1&comment[parent_id]=96'
```

### Adding an image to a post

```sh
json -X GET http://localhost:3000/v1/posts/1/images -d 'image[url]=http://www.example.com/image9.jpg'
```

Next steps:

0. Augment the spec suite to validate JSON schema
0. Add authentication
0. Format reporting output
0. Display reporting output by city
0. Research a more scalable way to store reporting data
