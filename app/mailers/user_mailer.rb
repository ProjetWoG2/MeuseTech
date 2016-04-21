class UserMailer < ApplicationMailer
  def banni(user, raison)
    @destinataire = user
    @raison = raison
    @subject = "Vous avez été banni du site Meusetech"
    mail(to: @destinataire.email, subject: @subject)
  end
end
