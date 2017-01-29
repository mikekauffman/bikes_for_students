## Bikes For Students

### A website that provides information for foreign exchange students working in Rehoboth Beach, DE

#### Development Flow

Make sure you have git installed and you are logged in on the command line [docs](https://git-scm.com/book/en/v2/Getting-Started-The-Command-Line)


If you haven't already, add a remote to point at this github repository AND to our production server:
```bash
git clone git@github.com:mikekauffman/bikes_for_students.git (this will copy the code locally and add a remote to point at it called "origin", so run this command from the directory you want the code to be copied into)
git remote add production https://git.heroku.com/j1rehoboth.git
```

### Steps you will do each time you want to make changes:

1) Get (pull down) the most recent changes
```bash
git pull origin master
```
2) Open the app's directory in your text editor (I think julie got Atom?)

3) Create your database, migrate the db, and start your rails development server:
```bash
rake db:create db:migrate
rails server
```
Note: You'll only need to migrate once. The db schema has not changed, and most of our storage is happening via google docs anyway.

4) Once your server is running, verify that everything is working locally by visiting http://localhost:3000/ in your browser. It should be an exact replica of the production website.

5) Make changes to the file you want to change
  - Main HTML markup can be found at `app/views/pages/home.html.erb`
  - Styles can be found in `app/assets/stylesheets/application.scss` and `scrollin-nav.scss` in the same directory

6) Save the files you have changed and check them in your [local server](localhost:3000/) to ensure nothing is broken and your changes are correct.

7) Add and commit those changes to git:
```bash
git add -p (this will step you through each chunk of code changes, press y to accept them and n to reject what you don't want to save)
git commit -m 'Some message here describing what changes you made'
git push origin master
```

8) Push the changes into production:
```bash
git push heroku master
```

9) Make sure you didn't break production by visiting j1rehoboth.com once the previous command completes

10) Pat self on back; you did it
