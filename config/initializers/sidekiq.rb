Sidekiq.configure_server do |config|
  config.average_scheduled_poll_interval = 5 #check every 5 sec if there is any job in the queue
end
