class AdminMailer < ApplicationMailer
  def nouveau_projet(admin, projet)
    @destinataire = admin
    @projet = projet
    @subject = "Un nouveau projet est en ligne! \"#{@projet.titre}\""
    mail(to: @destinataire.email, subject: @subject)
  end
end