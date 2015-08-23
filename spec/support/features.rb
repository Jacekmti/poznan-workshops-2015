require_relative 'features/session_helpers'
require_relative 'features/date_helpers.rb'

RSpec.configure do |config|
  config.include Features::SessionHelpers, type: :feature
  config.include Features::DateHelpers, type: :feature
end
