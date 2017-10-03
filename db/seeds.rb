# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


admin = User.create({
    username: "admin",
    password: "password",
    password_confirmation: "password",
    about: "About the Admin",
    admin: true
  })

user = User.create({
    username: "user",
    password: "password",
    password_confirmation: "password",
    about: "About the Basic user",
  })

disabled_user = User.create({
    username: "disabled_user",
    password: "password",
    password_confirmation: "password",
    about: "About the disabled user",
    disabled: true
  })

[
  {title: "Best smudgable pencil eyeliner I can go pick up at Sephora?", content: "I wanna know!"},
  {title: "Has anyone tried Kristen Ess's hair products from Target? Thoughts?", content: "I wanna know!"},
  {title: "I would like to get my teenage niece her first makeup items. Can anyone recommend makeup for a teenager with dark hair, brown eyes and olive skin tone?", content: "I wanna know!"},
  {title: "Does rogaine work on eyebrows?", content: "I wanna know!"},
  {title: "Has anyone tried Kristen Ess's hair products from Target? Thoughts?", content: "I wanna know!"},
  {title: "Best smudgable pencil eyeliner I can go pick up at Sephora?", content: "I wanna know!"},
].each do |item|
  #admin.items.create(item)
  user.items.create(item)
  #disabled_user.items.create(item)
end

[admin, user, disabled_user].each do |u|
  puts "created user: #{u.attributes.inspect}"
end

