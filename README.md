# Good Work

created by [Brian DiRito](https://github.com/bcdirito)

click [here](https://drive.google.com/file/d/1DQaE331ddGvn0OotC7OkMh2Nk9HFlo57/view?usp=sharing) for video demo

Good Work uses React.js for its front end and Ruby On Rails for its back end.

Good Work is a stress and anxiety reducing app that utilizes goal tracking and partner accountability.

## Install Instructions

  1. After cloning the lab, navigate to the repository.
  
  2. Type "bundle install" and hit enter to install the gems.
  
  3. Type "rake db:migrate" and hit enter to migrate the databases.
  
## Starting the Server
  *Be sure to do this first, as the fetch calls made in the front end are looking for the local host.*
  
  1. If you have successfully installed the gems and migrated the databases, type in "rails s" and hit enter.
  
  2. If this is successful, you will be on Ruby on Rails.

## Debugging Notes
  1. This app requires Ruby version 2.6.0. If you are using an earlier version, starting up the server will cause an error. To fix this, simply type "rvm default 2.6.0" in your terminal and hit enter. You will now be using this version.

  2. If you need to update to a more current version of ruby, simply type in "brew install ruby". You can then check to see what version you are running by typing in "ruby -v". If it is an earlier version than 2.6.0, type in "rvm default 2.6.0". You should now be able to run the server.
