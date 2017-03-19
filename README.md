Edumodo
========

The safest and easiest way for educators to connect and collaborate with students, parents, and each other.

TODO:
-----
1. [x] Homework contains a title, a question and a due date. Basic UI has been provided.
2. [x] Teacher can assign a homework to multiple students. Basic UI has been provided.
3. [x] Student can see all assigned homework. UI is required.
4. [x] Student can submit a homework multiple times before the due date. UI is required.
5. [x] Teacher can see a list of latest submissions for a homework. UI is required.
6. [x] Teacher can see all submission versions for a student for a homework.UI is required.

Setup:
------
```
git clone https://github.com/dharamgollapudi/edumodo.git
cd edumodo
bundle install
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
bundle exex rails s
```

Testing: 
--------
Tests were written both in `MiniTest::Unit` as well as `Rspec`
Run the appropriate command.
```
git clone https://github.com/dharamgollapudi/edumodo.git
cd edumodo
bundle install
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:test:prepare
```

For `MiniTest::Unit` run
```
bundle exex rake test
```

For `Rspec` run

```
bundle exex rspec
```

Caveat:
-------
When you sign up, by default, it setups you up as `Student`. 
The only way to override, for now, is changing it in database.
In the next iteration, we should be able to select the type while signing up.

Heorku:
-------
Application is running on `heroku` and available at `https://edumodo.herokuapp.com/`
with the following test accounts:

Teacher: teacher@gmail.com/teacher
Student: student@gmail.com/student