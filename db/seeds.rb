# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

fox = User.create(name:'Fox Mulder', email:'fox@xfiles.com', password:'area51', phone_number:'5856135657', panic_word:'abduction', clear_word:'mystery')

fox.contacts << Contact.create(name:'Dana Scully', phone_number:'8473239848')
fox.contacts << Contact.create(name:'Smoking Man', phone_number:'6268072936')

fox.notifications << Notification.create(note:'checking out old house',contact_time: DateTime.new(2015,10,20))

