# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.precompile += %w( animate.min.css bootstrap.min.css bootstrap-combined.min.css Custom.css Custom-ar.css Custom-en.css font-awesome.css font-awesome.min.css main.css )
Rails.application.config.assets.precompile += %w( prettyPhoto.css responsive.css responsive-ar.css responsive-en.css slick.css slick-theme.css slider.css Suzan.css )
Rails.application.config.assets.precompile += %w( bootstrap.min.js html5shiv.js jquery.isotope.min.js jquery.js jquery.prettyPhoto.js main.js multislider.js multislider.min.js )
Rails.application.config.assets.precompile += %w( respond.min.js slick.js slick.min.js wow.min.js )
Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( api.js )
Rails.application.config.assets.precompile += %w( pages.js )
Rails.application.config.assets.precompile += %w( display.js )
Rails.application.config.assets.precompile += %w( terms.js )
Rails.application.config.assets.precompile += %w( email.js )
