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
Rails.application.config.assets.precompile += %w( animate.min.css bootstrap.min.css bootstrap-combined.min.css Custom-en.css font-awesome.css font-awesome.min.css main.css bootstrap.min.css)
Rails.application.config.assets.precompile += %w( prettyPhoto.css responsive.css Suzan.css slider.css responsive-en.css Custom.css Suzan-en.css)
Rails.application.config.assets.precompile += %w( responsive-ar.css Custom-ar.css prettyPhoto-ar.css slider-ar.css Suzan-ar.css bootstrap.rtl.min.css font-awesome.min-ar.css animate.min-ar.css main-ar.css)
Rails.application.config.assets.precompile += %w( bootstrap.min.js html5shiv.js jquery.isotope.min.js jquery.js jquery.prettyPhoto.js main.js multislider.js multislider.min.js )
Rails.application.config.assets.precompile += %w( respond.min.js slick.js slick.min.js wow.min.js )
Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( api.js )
Rails.application.config.assets.precompile += %w( pages.js )
Rails.application.config.assets.precompile += %w( display.js )
Rails.application.config.assets.precompile += %w( terms.js )
Rails.application.config.assets.precompile += %w( data.js )
Rails.application.config.assets.precompile += %w( flash.js )
Rails.application.config.assets.precompile += %w( haml.css )
Rails.application.config.assets.precompile += %w( leaflet.css )
Rails.application.config.assets.precompile += %w( leaflet.js )
Rails.application.config.assets.precompile += %w( json_maps.js )
Rails.application.config.assets.precompile += %w( terms.js )
Rails.application.config.assets.precompile += %w( leaflet-src.js )
Rails.application.config.assets.precompile += %w( MarkerCluster.css )
Rails.application.config.assets.precompile += %w( MarkerCluster.Default.css )
Rails.application.config.assets.precompile += %w( leaflet.markercluster.js )
# Rails.application.config.assets.precompile += %w(markerclusterer.js )

Rails.application.config.assets.precompile += %w( bloodhound.js)
Rails.application.config.assets.precompile += %w( typeahead.jquery.js)
Rails.application.config.assets.precompile += %w( Control.FullScreen.css )
Rails.application.config.assets.precompile += %w( Control.FullScreen.js)
Rails.application.config.assets.precompile += %w( Control.Loading.css )
Rails.application.config.assets.precompile += %w( Control.Loading.js )
Rails.application.config.assets.precompile += %w( Leaflet.NavBar.css )
Rails.application.config.assets.precompile += %w( Leaflet.NavBar.js )
Rails.application.config.assets.precompile += %w( freezable.js )
Rails.application.config.assets.precompile += %w( maps_leaflet.js )
Rails.application.config.assets.precompile += %w( jquery.lazyload.js )
Rails.application.config.assets.precompile += %w( signup.js )
Rails.application.config.assets.precompile += %w( refinery_reload.js )
Rails.application.config.assets.precompile += %w( user_providers_registration_modal.js )
Rails.application.config.assets.precompile += %w( user_providers_hidden_form.js )
Rails.application.config.assets.precompile += %w( shared/data_row.js )
Rails.application.config.assets.precompile += %w( collected_pages_search.js )
Rails.application.config.assets.precompile += %w( display_input.js )
Rails.application.config.assets.precompile += %w( initializeConstants.js )
Rails.application.config.assets.precompile += %w( search_filter.js )
Rails.application.config.assets.precompile += %w( change_resource_position.js )

# Rails.application.config.assets.precompile += %w( typeahead.bundle.js)
# Rails.application.config.assets.precompile += %w( typeahead.bundle.min.js)

# # For leaflet maps
# %w( leaflet MarkerCluster MarkerCluster.Default Control.FullScreen Leaflet.NavBar Control.Loading ).each do |css_asset|
  # Rails.application.config.assets.precompile << "#{css_asset}.css"
# end
# 
# # TODO: remove last entry (should be dynamically loaded json)
# %w( leaflet leaflet.markercluster Control.FullScreen Leaflet.NavBar freezable Control.Loading maps_leaflet 5169 ).each do |js_asset|
  # Rails.application.config.assets.precompile << "#{js_asset}.js"
# end

