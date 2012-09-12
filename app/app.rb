class SouldatosSpike < Padrino::Application
  use ActiveRecord::ConnectionAdapters::ConnectionManagement
  register Padrino::Rendering
  register Padrino::Mailer
  register Padrino::Helpers

  enable :sessions
  set :reload, true
  layout :layout

  Slim::Engine.set_default_options :pretty => true

  get :index do
    render 'index', locals: {page_title: "Summary"}
  end
end
