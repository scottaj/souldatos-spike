# Student Grade Statistical Analysis Prototype #

## About this prototype ##
This is a low fidelity prototype of an application specified by Dr. Ioannis Souldatos at the University of Detroit Mercy.

This prototype is not intended to be a perfect model of the application requirements and it does not implement many of the specified features. It is intended to capture the essence of the desired application and to model both potential implementation technologies and user interactions. This application is in no way suitable for production usage, nor will it ever be.

## Installation ##

### *nix ###
1. Install [rvm](rvm.io)
1. Install sqlite3 for your version of *nix
1. Run "_git clone git://github.com/scottaj/souldatos-spike.git_"
1. cd into the cloned directory
1. Run "_bundle install_"
1. Run "_bundle exec rake ar:setup_"

### Windows ###
1. Install [Ruby 1.9.3](http://rubyinstaller.org/downloads/) for Windows.
   * On the second tab of the install make sure you check the _Add Ruby executable to your PATH_ option.
1. Install the Ruby for Windows [development kit](http://rubyinstaller.org/downloads/)
   * Download and extract the archive
   * Open a Command Prompt in the extracted archive directory
   * Run the command "_ruby dk.rb init_"
   * Run the command "_ruby dk.rb install_"
1. Install [github for windows](http://windows.github.com/)
   * You will need to sign up for a Github Account
1. Clone the repository by clicking the _Clone in Windows_ button on [github](https://github.com/scottaj/souldatos-spike)
1. Go to the dashboard on the Github application.
1. Install Ruby libraries
   * Right click on the project and click _open a shell here_
   * This should open a Powershell window
   * Enter the command "_gem install bundler_"
   * Enter the command "_bundle install_"
1. Setup the database by running the command "_bundle exec rake ar:setup_"
   
## Running ##

1. After installation run the command "_bundle exec padrino start_" in the application directory to start the web server.
1. Open a web browser and navigate to [http://localhost:3000] to use the application.