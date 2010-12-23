module Sinatra
  module Filler
    # Capture a block of filler to be rendered later. For example:
    #
    #     <% filler_for :head do %>
    #       <script type="text/javascript" src="/foo.js"></script>
    #     <% end %>
    #
    # You can call +filler_for+ multiple times with the same key
    # (in the example +:head+), and when you render the blocks for
    # that key all of them will be rendered, in the same order you
    # captured them.
    #
    # Your blocks can also receive values, which are passed to them
    # by <tt>yield_filler</tt>
    def filler_for(key, &block)
      filler_blocks[key.to_sym] << block
    end

    def filler_for?(key)
      filler_blocks.has_key?(key.to_sym)
    end

    # Render the captured blocks for a given key. For example:
    #
    #     <head>
    #       <title>Example</title>
    #       <% output_filler_for :head %>
    #     </head>
    #
    # Would render everything you declared with <tt>filler_for
    # :head</tt> before closing the <tt><head></tt> tag.
    #
    # You can also pass values to the filler blocks by passing them
    # as arguments after the key:
    #
    #     <% yield_filler :head %>
    def output_filler_for(key)
      filler_blocks[key.to_sym].map do |content|
        content.call
      end.join
    end

    # Capture title in templates:
    #
    # <% title "Sinatra is awesome!" %>
    #
    # Use the captured block in layouts:
    #
    # <head>
    #   <title><%= filler_for?(:title) ? output_filler_for(:title) : "Untitled" %></title>
    # </head>
    # <body>
    # <% if filler_for?(:title) && show_title? %>
    #   <h1><%= output_filler_for(:title) %></h1>
    # <% end %>
    def title(page_title, show_title = true)
      filler_for(:title) { page_title.to_s }
      @show_title = show_title
    end

    def show_title?
      @show_title
    end

    # Capture content in templates:
    #
    # <% javascripts "/js/application.js" %>
    # <% stylesheets "/css/application.css" %>
    #
    # Use the captured blocks in layouts:
    #
    # <head>
    #   <%= output_filler_for(:head) %>
    # </head>
    def stylesheets(*args)
      filler_for(:head) { stylesheet_link_tag(*args) }
    end

    def javascripts(*args)
      filler_for(:head) { javascript_script_tag(*args) }
    end

    private

    def filler_blocks
      @filler_blocks ||= Hash.new {|h,k| h[k] = [] }
    end

  end

  helpers Filler
end
