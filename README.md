# Sinatra Extension

An inline example:

    require 'rubygems'

    $LOAD_PATH.unshift File.dirname(__FILE__) + '/lib'

    require 'sinatra'
    require 'erubis'

    set :erubis, :pattern => '\{% %\}', :trim => true

    require 'rdiscount'

    set :markdown, :layout => false

    require 'sinatra/static_assets'
    require 'sinatra/filler'

    get '/about' do
       "I'm running version " + Sinatra::VERSION
    end

    get '/' do
      erubis markdown(:index)
    end

    __END__

    @@layout
    <meta charset="utf-8" />
    <title>{%= filler_for?(:title) ? output_filler_for(:title) : "Untitled" %}</title>
    {%= output_filler_for(:head) -%}
    <body>
    {% if filler_for?(:title) && show_title? %}
    <h1>{%= output_filler_for(:title) %}</h1>
    {% end %}
    {%= yield -%}

    @@ index
    {% javascripts "/js/application.js" %}
    {% stylesheets "/css/application.css" %}
    {% title "Hello Markdown!" %}
    Sinatra & Tilt are awesome!

The above example uses two sinatra extensions:

* *sinatra-static-assets*
* *sinatra-filler*

to install the extensions run:

    gem install sinatra-static-assets sinatra-filler
