# To Do(things needs to be done)
- change invitations to event_mails <b>-done</b>
  - rails g model event_mails event:references name:string subject:string <b>-done</b>
  - test
- add EventMailer  <b>-done</b>
  - refactor code from membermailer <b>-done</b>
  - add templating methods <b>-started</b>
- rails g model EventMailLog event_mail:references member:references member_token:references <b>-done</b>
- rails g migration AddTimesUsedAndNotesToMemberTokens times_used:integer notes:text  <b>-done</b>
  - maybe require notes to exist
  - ensure token times_used is incremented when it's checked
- move pause into application mailer so it is enforced for all emails <b>-done</b>
- add after_action for event_email to create new event_email_log  <b>-done</b>
- create event_mailing_job class that: <b>-done</b>
  - takes an event_mail object <b>-done</b>
  - takes a list of members  <b>-done</b>
  - loops through each member and: <b>-done</b>
    - finds_or_creates an RSVP for that member and that event <b>-done</b>
    - create a new token for that member and that RSVP with a note about it's creation <b>-done</b>
    - pass the event_email to the EventMailer and call deliver_later <b>-done</b>
- EventMail:
  - add a sent? flag for event_mail model <b>-done</b>
  - EventMail: includes_RSVP? flag <b>-done</b>
  - Add templating <b>-done</b>
- Rsvp: if new then status = 'Unanswered' <b>-done</b>
- create a scaffold_controller for mailings
  - rails g scaffold_controller admin/mailing --model-name:event_mail
  - create form for sending mailings


- rename memberToken to token
- create a token controller



# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
