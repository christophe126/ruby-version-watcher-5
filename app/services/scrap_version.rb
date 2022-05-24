require 'mechanize'

class ScrapVersion
  def check_new_version_ruby
    result = []
    mechanize = Mechanize.new
    read_data = mechanize.get('https://www.ruby-lang.org/fr/news/')
    first_div_post = read_data.search('div.post').first
    if first_div_post.search('p').first.text[0..3] == "Ruby"
      ruby_version = first_div_post.search('p').first.text.strip.split[1]
      ruby_date = first_div_post.search('p').last.text.strip.split[4]
      result = [ruby_version, ruby_date]
    end
    return result
  end
end


p = ScrapVersion.new
r = p.check_new_version_ruby
p r
