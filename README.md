## Agent Alert

[Deployed on Heroku](https://agent-alert.herokuapp.com/)

###The Motivation

The Real Estate industry is unlike many others in that you must engage frequently with people you've just met in places you are oftentimes unfamiliar with. In order to succeed in this competitive business, you must respond to leads from complete strangers, that may have seen your information online or elsewhere in the hope that they convert to clients.

Most homes are typically empty during showings, even if the homes are normally occupied. This creates an opportunity for people looking to do harm to real estate agents. One recent and unfortunate event was that of the murder of [Beverly Carter](http://www.cnn.com/2014/10/01/us/real-estate-risks/), a real estate broker who was abducted and murdered while showing a home in 2014.

Agent Alert is a discreet tool that agents can use to help notify others if something isn't going as it should.

###How It Works

MVP:

An real estate agent can sign up for Agent Alert and enter the names and phone numbers of a handful of contacts they would like to be notified in the event that something goes wrong. Agents select a custom 'panic word'. If at any time the agent texts this panic word to Agent Alert's number, an alert message is sent to all of that agent's contacts.

MVP+:

Before an agent goes into an appointment they can establish a "notification" by texting agent alert a length of time along with a note. The length of time is how long they would like agent alert to wait before checking back in with them. The note is a little piece of information that would be helpful in the event that something goes wrong (who they were meeting with or where they were going). If the agent doesn't respond promptly with their "clear word" to the check in by Agent Alert, or if Agent Alert receives the "panic word", Agent alert will send a alert message, along with the agent's note to all of the agent's contacts.

###Database Design

![alt text](https://github.com/shawndav/agentalert/blob/master/images/schema.png "Agent Alert Schema")


###User Stories

As a user I...

MVP (Currently deployed on Heroku):

√ Want to be able to sign up securely

√ Want to be able to log in

√ Want to be able to log out

√ Want to be able to add contacts

√ Want to be able to remove contacts

√ Want to view my contacts on my profile page

√ Want to be able to send test text messages to contacts

√ Want to be able to edit my phone number via the profile page

√ Want to be able to send a test text to my entered phone number

√ Want to be able to have a "panic word" (created at sign up)

√ Want to be able to change this panic word at will from my profile page

√ Want all my contacts to be notified via text if I text my panic word to agent alert at any time

√ Want to receive a message from Agent Alert when I sign up confirming that the number was entered correctly

MVP+ (Not yet deployed on Heroku - running locally and in this repo):

√ Want to be able to have a "clear word" (created at sign up)

√ Want to be able to change this clear word at will from my profile page

√ Want to be able to text agent alert to set up a 'notification'

√ Want to be able to provide a 'note' for the notification (also via text) to give more information about what I am doing / where I am going.

- Want to be told if the phone number I am entering is improperly formatted

- Want to receive a message from Agent Alert when I sign up confirming that the number was entered correctly

- Want to be able to set a time for agent alert to check back in with me via text

- If I don't respond within a certain amount of time, or send my panic word as part of a response, I want my contacts to be notified

- If I have provided a note as part of the notification, I want this note to be sent to my contacts as well

