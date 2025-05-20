# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!
Rails.application.config.action_view.field_error_proc = Proc.new do |html_tag, instance|
  if html_tag =~ /<input|textarea|select/
    doc = Nokogiri::HTML::DocumentFragment.parse(html_tag)
    tag = doc.children[0]
    tag['class'] = "#{tag['class']} is-invalid".strip
    doc.to_html.html_safe
  else
    html_tag.html_safe
  end
end