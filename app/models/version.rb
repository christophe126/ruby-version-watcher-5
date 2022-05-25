class Version < ApplicationRecord


  def self.to_csv
    attributes = %w{num_version date_version}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |version|
        csv << version.attributes.values_at(*attributes)
      end
    end
  end

   def check_new_version_ruby
    result = []
    mechanize = Mechanize.new
    read_data = mechanize.get('https://www.ruby-lang.org/fr/news/')
    first_div_post = read_data.search('div.post').first
    if first_div_post.search('p').first.text[0..3] == "Ruby"
      ruby_version = first_div_post.search('p').first.text.strip.split[1]
      ruby_date = first_div_post.search('p').last.text.strip.split[4]
      result = [ruby_version, ruby_date]
      puts result
    end
    return result
  end


end
