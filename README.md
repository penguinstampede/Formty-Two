#Formty-Two: For using Google Forms without the Google Forms.

Give Formty-Two a Google Form ID, and it will generate a `.slim` file for you.

Use the Rake task!  Add `require 'formty-two/tasks'` to your Rakefile, then on the command line run `rake formty:build_slim[GOOGLE_FORM_ID]`.

##TODO:

Lots!

- Put files into a folder and name it something other than "test.slim"
- Make the folder and filename variable.
- Create slim and ERB partial templates for each input field
