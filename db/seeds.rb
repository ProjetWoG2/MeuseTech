# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Action.all.empty?
  ["Bannir", "Supprimer", "Editer", "Ajouter"].each do |action|
    Action.create(label: action)
  end
end

if Cible.all.empty?
  ["Actions", "Articles", "Articles_Media", "Attachements", "Cibles", "Commentaires", "Comptes", "Interactions", "Media", "Permissions", "Projets", "Publications", "Sondages", "Statuts", "Utilisateurs"].each do |cible|
    Cible.create(nom_table: cible)
  end
end

if Attachement.all.empty?
  ["Domicile", "Travail", "Loisirs"].each do |attachement|
    Attachement.create(label: attachement)
  end
end

if Statut.all.empty?
  ["SuperAdmin", "Administrateur", "Contributeur"].each do |statut|
    Statut.create(label: statut)
  end
end

if Compte.all.empty?
   Compte.create(
   email: "superadmin@meusetech.com",
   pseudo: "SuperAdmin",
   nom: "Admin",
   prenom: "Super",
   statut_id:1,
   password: "superadmin",
   password_confirmation: "superadmin",
   confirmed_at: DateTime.now,
   unconfirmed_email: "superadmin@meusetech.com")
end