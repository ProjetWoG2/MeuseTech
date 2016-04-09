module ApplicationHelper
  def svg(name)
    file_path = "#{Rails.root}/app/assets/images/#{name}.svg"
    return File.read(file_path).html_safe if File.exists?(file_path)
    '(not found)'
  end
    
  def resource_name
    :compte
  end

  def resource
    @resource ||= Compte.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:compte]
  end
end
