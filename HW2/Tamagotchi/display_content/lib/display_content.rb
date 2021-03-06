require "display_content/version"
require "erb"
require "cgi/util"

module DisplayContent
  class Error < StandardError; end
  def self.display_content(content, bypass_html = false, file_name = "index")
    bypass_html ? content : content = CGI.escapeHTML(content)
    output_file = File.expand_path("#{file_name}.html")
    template = %(<!DOCTYPE html>
  <html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>DisplayContent gem output</title>
    <link rel="stylesheet" href="style.css">
  </head>
  <body>
    <%= @content %>
  </body>
  </html>
  )
    @content = content
    renderer = ERB.new(template)
    result = renderer.result(binding)
    File.open(output_file, "w") do |f|
      f.write(result)
    end
  end
end
