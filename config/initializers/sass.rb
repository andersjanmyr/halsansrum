Sass::Plugin.options.merge!(
  :template_location => "#{Rails.root}/app/stylesheets",
  :css_location => "#{Rails.root}/tmp/stylesheets"
)

Rails.configuration.middleware.delete('Sass::Plugin::Rack')
Rails.configuration.middleware.insert_before('Rack::Sendfile', 'Sass::Plugin::Rack')

Rails.configuration.middleware.insert_before('ActionDispatch::Static', 'Rack::Static',
    :urls => ['/stylesheets/application.css', '/stylesheets/home.css'],
    :root => "#{Rails.root}/tmp")

