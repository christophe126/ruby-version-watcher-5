set :environment, 'development'
env :PATH, ENV['PATH']
set :output, "config/schedule.log"
set :output, { :error => 'config/schedule_error.log', :standard => "config/schedule.log" }
set :path, '/Users/christophe/code/christophe126/ruby-version-watcher-5'

#every 1.day, at: '11:00 pm' do
every 1.minute do
  runner "ScrapVersion.check_new_version_ruby", :output => '/Users/christophe/code/christophe126/ruby-version-watcher-5/config/schedule.log'
end
