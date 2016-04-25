# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.precompile += %w( application.scss )
Rails.application.config.assets.precompile += %w( messages.css )
Rails.application.config.assets.precompile += %w( footer.css )
Rails.application.config.assets.precompile += %w( navbar.css )
Rails.application.config.assets.precompile += %w( sidebar.css )
Rails.application.config.assets.precompile += %w( editeur.css )
Rails.application.config.assets.precompile += %w( navbartop.scss )
Rails.application.config.assets.precompile += %w( the_role_management_panel.css.scss )
Rails.application.config.assets.precompile += %w( projets.css.scss )


Rails.application.config.assets.precompile += %w( application.js )
Rails.application.config.assets.precompile += %w( messages.js )
Rails.application.config.assets.precompile += %w( navbar.js )
Rails.application.config.assets.precompile += %w( navbartop.js )
Rails.application.config.assets.precompile += %w( sidebar.js )
Rails.application.config.assets.precompile += %w( editeur.js )
Rails.application.config.assets.precompile += %w( bootstrap.js.coffee )
Rails.application.config.assets.precompile += %w( the_role_editinplace.js.coffee )
Rails.application.config.assets.precompile += %w( the_role_management_panel.js )
Rails.application.config.assets.precompile += %w( the_role_management_panel_initializer.js.coffee )
Rails.application.config.assets.precompile += %w( pages.js )