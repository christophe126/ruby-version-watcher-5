require 'mechanize'

class ScrapVersion
  def self.check_new_version_ruby
    result = []
    mechanize = Mechanize.new
    read_data = mechanize.get('https://www.ruby-lang.org/fr/news/')
    first_div_post = read_data.search('div.post').first
    type_version = first_div_post.search('a').first.text.strip
    ruby_date = first_div_post.search('p').last.text.strip.split[4]

    if type_version.split[0] == "Ruby"
      ruby_version = type_version.split[1]
      result = [ruby_version, ruby_date]
      trace_log(1,result, "Version on Website")
      check_last_version(result, true)
    elsif type_version.split[0] == "Fin"
      ruby_version = type_version.split[-1]
      result = [ruby_version, ruby_date]
      trace_log(6,result, "End support")
      check_last_version(result, false)
    end
  end

  def self.check_last_version(version_scrap, new_or_support)
      @db_version = Version.where(new_version: new_or_support).last
      trace_log(2,[@db_version.num_version, @db_version.date_version], "Version in Database")

      if version_scrap[0] != @db_version.num_version
        new_insert_data(version_scrap, new_or_support)
        # Envoi du mail
        envoi_de_mail(new_or_support)
      else
        trace_log(5,['Pas de nouvelle version',""],"")
      end
      puts "-----------------------------------------------------------"
  end

  def self.new_insert_data(data_version, new_or_support)
    @insert_version = Version.new
    @insert_version.num_version = data_version[0]
    @insert_version.date_version = data_version[1]
    @insert_version.new_version = new_or_support
    @insert_version.support_version = !new_or_support
    @insert_version.save!
    trace_log(3,[@insert_version.num_version, @insert_version.date_version], "Save in Database")
  end

  def self.envoi_de_mail(new_or_support)
    @user = 'christophe126@gmail.com'
    result = MymailMailer.with(user: @user).welcome_email(new_or_support).deliver_now
    trace_log(4,[result,""], "Mail sent")
  end

  def self.trace_log(num, data_version, description)
   puts "#{Time.now} : #{description} #{data_version[0]} - #{data_version[1]}"
  end
end
