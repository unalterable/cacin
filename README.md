# To Do
- change invitations to event_emails
- add EventMailer
- rails g model EventEmailLog event_email:references member:references
- rails g migration AddTimesUsedAndNotesToRsvps times_used:integer notes:text
  - maybe require notes to exist
  - ensure token times_used is incremented when it's checked
- add after_action for event_email to create new event_email_log
- move pause into application mailer
- create event_email_job class that:
- takes an event_email object
  - takes a list of members
  - loops through each member and:
    - finds_or_creates an RSVP for that member and that event
      - if new say status=unanswered
    - create a new token for that member and that RSVP with a note about it's creation
    - pass the event_email to the EventMailer and call deliver_later


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
