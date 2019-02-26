require 'json'
require 'activeresource'

class Notification < ActiveResource::Base
  self.site = ENV['APP_SITE']
end

def create(event:, context:)
  notification = Notification.new(name: event['name'], content: event['content'])
  notification.save
  notification.to_json
end
