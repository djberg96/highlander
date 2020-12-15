= Description
  A gem that ensures only one instance of your main script is running.
  In short, there can be only one.

= Installation
  gem install highlander

= Synopsis
  require 'highlander' # This should be the -first- thing in your code.
  # Your code here

  # Meanwhile, back on the command line...

  # First attempt, works. Assume it's running in the background.
  ruby your_script.rb

  # Second attempt while the first instance is still running, fails.
  ruby your_script.rb # => RuntimeError 

= Notes
  Simply requiring the highlander gem ensures that only one instance
  of that script cannot be started again. If you try to start it again
  it will raise a RuntimeError.

= Known Issues
  If you start your program, modify it while its running, and run it again
  then this library will not work.

= Acknowledgements
  Ara Howard for ideas.

= License
  Apache-2.0

= Copyright
  (C) 2010-2020 Daniel J. Berger
  All Rights Reserved.

== Warranty
  This package is provided "as is" and without any express or
  implied warranties, including, without limitation, the implied
  warranties of merchantability and fitness for a particular purpose.

= Author
  Daniel Berger
