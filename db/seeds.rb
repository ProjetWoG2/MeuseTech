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
      prenom: "Chuck",
      confiance: true
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
      prenom: "Lorraine",
      confiance: true
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
      prenom: "Axel",
      confiance: false
    )

    User.create(
      role_id: "3",
      email: "auteur@meusetech.com",
      password: "meusetech",
      password_confirmation: "meusetech",
      confirmed_at: DateTime.now,
      unconfirmed_email: "auteur@meusetech.com",
      pseudo: "L'auteur'",
      nom: "Auboisdormant",
      prenom: "Abel",
      confiance: false
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
end

if Thematique.all.empty?
    ['Agriculture', 'Développement durable', 'Économie', 'Emploi/Formation', 'Habitat', 'Services à la population', 'Tourisme/Culture', 'Numérique', 'Santé', 'Autre'].each do |thematique|
        Thematique.create(categorie: thematique)
  end
end