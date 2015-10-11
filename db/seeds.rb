# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Country.create(id: 1, name: "Brasil")
State.create(id: 1, name: "Paraná", initial: "PR", country_id: 1)
State.create(id: 2, name: "Rio de Janeiro", initial: "RJ", country_id: 1)
State.create(id: 3, name: "São Paulo", initial: "SP", country_id: 1)
City.create(id: 1, name: "Mandaguari", state_id: 1)
City.create(id: 2, name: "Rio de Janeiro", state_id: 2)
City.create(id: 3, name: "Campinas", state_id: 3)
HealthPlan.create(id: 1, name: "Uniodonto")
HealthPlan.create(id: 2, name: "Amil Dental")