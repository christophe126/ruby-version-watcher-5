require 'mechanize'

class ScrapVersion
  def self.check_new_version_ruby
    result = []
    mechanize = Mechanize.new
    read_data = mechanize.get('https://www.ruby-lang.org/fr/news/')
    first_div_post = read_data.search('div.post').first
    puts first_div_post
    # c'est une version de ruby
    if first_div_post.search('p').first.text[0..3] == "Ruby"
      ruby_version = first_div_post.search('p').first.text.strip.split[1]
      ruby_date = first_div_post.search('p').last.text.strip.split[4]
      result = [ruby_version, ruby_date]
      trace_log(1,result)
      check_last_version(result)
    end
  end


  def self.check_last_version(version_scrap)
      @db_version = Version.last
      trace_log(2,[@db_version.num_version, @db_version.date_version])
      if version_scrap[0] != @db_version.num_version
        @insert_version = Version.new
        @insert_version.num_version = version_scrap[0]
        @insert_version.date_version = version_scrap[1]
        @insert_version.save!
        trace_log(3,[@insert_version.num_version, @insert_version.date_version])
        # Envoi du mail
        @user = 'christophe126@gmail.com'
        result = MymailMailer.with(user: @user).welcome_email.deliver_now
        trace_log(4,[result])
      else
        trace_log(5,['Pas de nouvelle version'])
      end
      puts "-----------------------------------------------------------"
  end

  def self.trace_log(num, data_version)
    case num
    when 1 then puts "#{Date.today} : Version on Website #{data_version[0]} du #{data_version[1]}"
    when 2 then puts "#{Date.today} : Version in Database #{data_version[0]} du #{data_version[1]}"
    when 3 then puts "#{Date.today} : Save in Database #{data_version[0]} du #{data_version[1]}"
    when 4 then puts "#{Date.today} : Mail sent #{data_version[0]}"
    when 5 then puts "#{Date.today} : #{data_version[0]}"
    end
  end
end
