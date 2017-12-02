# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
- [x] Include more than one model class (list of model class names e.g. User, Post, Category) - activity, destination, user models
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts) - Destination has many activities, User has many destinations and activities through destinations
- [x] Include user accounts - require username and password
- [x] Ensure that users can't modify content created by other users - users are unable to modify each other's content
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - Destinations and Activities are able to be created, read, updated, and destroyed
- [x] Include user input validations - all fields need to be filled out to create User, Destination, or Activity
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new) - Messages pop up on screen for invalid destinations and activities
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
