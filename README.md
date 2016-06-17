#Formty-Two: For using Google Forms without the Google Forms.

Give Formty-Two a Google Form ID, and it will generate a file for you with the forms in your template of choice.

Currently supports slim, and plain HTML (good for ERB/Liquid?), and the Foundation framework.

Use the Rake task!  Add `require 'formty-two/tasks'` to your Rakefile, then on the command line run `rake formty:build_slim[GOOGLE_FORM_ID,TEMPLATE,FRAMEWORK]` or just include the form ID to build a slim template using the Foundation framework.

###TODO:

- More templates?
- More field types? (currently just supports text/radio/checkbox, ignores "other" choices)
- How do we handle multi-page forms? (Do we?)
