# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
airporta = Airport.create(name: "SFO")
airportb = Airport.create(name: "NYC")
airportc = Airport.create(name: "MAD")
airportd = Airport.create(name: "EZE")
airporte = Airport.create(name: "MMX")

flighta = Flight.create(code: "ABC123", from_airport_id: 1, to_airport_id: 5, date: Time.now, duration: 50)
flightb = Flight.create(code: "XXX114", from_airport_id: 3, to_airport_id: 2, date: Time.now, duration: 120)
flightc = Flight.create(code: "ADS246", from_airport_id: 1, to_airport_id: 2, date: Time.now, duration: 300)
flightd = Flight.create(code: "ZZZ999", from_airport_id: 5, to_airport_id: 4, date: Time.now, duration: 600)