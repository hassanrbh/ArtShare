# frozen_string_literal: true

module ApplicationHelper
  def auth_token
    auth = '<input type="hidden"'

    auth += 'name="authenticity_token"'
    auth += "value=\"#{form_authenticity_token}\""
    auth += '/>'
    auth.html_safe
  end

  def sign_in
    "<a class=\"button\" href=\"#{signin_path}\">Sign in</a>".html_safe
  end

  def sign_up
    "<a class=\"button\" href=\"#{signup_path}\">Sign up</a>".html_safe
  end

  def albums_helper(albums_instance)
    albums = "<li><a href=\"#{band_path(albums_instance.id)}\">"

    albums += "<p>#{albums_instance.name}</p>"
    albums += '</a>'
    albums.html_safe
  end

  def ugly_lyrics(lyrics)
    parser_string = ''.dup
    lyrics.lines.each do |line|
      parser_string << "&#9835;  #{html_escape(line)}"
    end
    "<pre class='lyrics'>#{parser_string}</pre>".html_safe
  end
end
