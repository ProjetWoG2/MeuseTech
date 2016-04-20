class AdminMailer < ApplicationMailer
  
  def nouveau_projet(admin, projet)
    @destinataire = admin
    @projet = projet
    @subject = "Un nouveau projet est en ligne! \"#{@projet.titre}\""
    mail(to: @destinataire.email, subject: @subject)
  end

  def nouveau_commentaire(admin, commentaire)
    @destinataire = admin
    @comment = commentaire
    @subject = "Un commentaire est en attente de validation!"
    mail(to: @destinataire.email, subject: @subject)
  end








end