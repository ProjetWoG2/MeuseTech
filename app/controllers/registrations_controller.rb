class RegistrationsController < Devise::RegistrationsController

  def create
    super
    if resource.save
      @destinataires = User.where(role_id: 2)
      add_new_notif("Nouvel Utilisateur", "User", resource.id, @destinataires)
    end
  end
    
  def add_new_notif(type, section, sujet, destinataires)
    destinataires.each do |destinataire|
        @notification = Notification.new
        @notification.contenu = type
        @notification.section = section
        @notification.sujet = sujet 
        @notification.destinataires = destinataire.id
        @notification.save
    end
  end
end 