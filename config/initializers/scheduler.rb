#
# config/initializers/scheduler.rb

require 'rufus-scheduler'

# Let's use the rufus-scheduler singleton
#
s = Rufus::Scheduler.singleton


unless defined?(Rails::Console) || File.split($0).last == 'rake'

  # Stupid recurrent task...
  #
  s.every '7d' do

    Rails.logger.info "Newsletter"
    Rails.logger.flush

   Newsletter.newsletter
  end
end
