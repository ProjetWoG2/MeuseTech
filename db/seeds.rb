# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Action.all.empty?
  ["Bannir => Contributeur", "Supprimer => Admin", "Editer => Admin", "Supprimer => Contributeur", "Editer => Contributeur", "ChangerRole => Contributeur->Admin"].each do |action|
    Action.create(label: action)
  end
end

if Attachement.all.empty?
  ["Domicile", "Travail", "Loisirs"].each do |attachement|
    Attachement.create(label: attachement)
  end
end

if Role.all.empty?
  ["SuperAdmin", "Admin", "Contributeur"].each do |statut|
    Role.create(label: statut)
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
      pseudo: "SuperAdmin",
      nom: "Admin",
      prenom: "Super"
    )
end

