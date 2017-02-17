module ApplicationHelper

  def auth_token
    html = "<input name='authenticity_token' value='#{form_authenticity_token}' type='hidden'>"
    html.html_safe
  end

  def ugly_lyrics(string)
    lines = string.split("\n")
    lines.each do |line|
      line.prepend("&#9835 ")
    end
    lines.join("\n").html_safe
  end
end
