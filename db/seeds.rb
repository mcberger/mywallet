# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create({
	fname: "ren",
	lname: "zlat",
	email: "renzl@gmail.com",
	password: "rennie",
	phone: 681378894
	})

user2 = User.create({
	fname: "mai",
	lname: "berg",
	email: "bergsie@gmail.com",
	password: "iammai",
	phone: 681378894
	})

card1 = Card.create({
	cardtype: "Visa",
	cardnumber: "4786478394839182",
	expmonth: 12,
	expyear: 2019
	})

card2 = Card.create({
	cardtype: "Mastercard",
	cardnumber: "5509876512345678",
	expmonth: 3,
	expyear: 2018
	})
