# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Attachement.all.empty?
  ["Domicile", "Travail", "Loisirs"].each do |attachement|
    Attachement.create(label: attachement)
  end
end

if User.all.empty?
    User.create(
      role_id: "1",
      email: "superadmin@meusetech.com",
      password: "superadmin",
      password_confirmation: "superadmin",
      confirmed_at: DateTime.now,
      unconfirmed_email: "superadmin@meusetech.com",
      pseudo: "Dieu",
      nom: "Norris",
      prenom: "Chuck"
    )

    User.create(
      role_id: "2",
      email: "lorn@meusetech.com",
      password: "meusetech",
      password_confirmation: "meusetech",
      confirmed_at: DateTime.now,
      unconfirmed_email: "lorn@meusetech.com",
      pseudo: "Lorn",
      nom: "Caillas",
      prenom: "Lorraine"
    )

    User.create(
      role_id: "3",
      email: "contributeur@meusetech.com",
      password: "meusetech",
      password_confirmation: "meusetech",
      confirmed_at: DateTime.now,
      unconfirmed_email: "contributeur@meusetech.com",
      pseudo: "Le Contrib'",
      nom: "Aire",
      prenom: "Axel"
    )
end

if Role.all.empty? 
  Role.create(
    name: "admin",
    title: "Role for admin",
    description: "this user can do anything",
    the_role: "{\"system\":{\"administrator\":true}}",
    created_at: DateTime.now
    )

  Role.create(
    name: "animateur",
    title: "Role for animateur",
    description: "les animateurs ne peuvent pas s\'autogérer",
    the_role: "{\"moderator\":{\"contributeurs\":true}}",
    created_at: DateTime.now
    )

  Role.create(
    name: "contributeur",
    title: "Role for contributeur",
    description: "Un contributeur est un utilisateur authentifié qui peut proposer un projet et participer à un sondage",
    the_role: "",
    created_at: DateTime.now
    )
end

