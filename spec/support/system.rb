# Tells RSpec how to run end-to-end system tests (use rack_test, which is
# provided by Capybara to simulate a browser DOM tree without JavaScript).
RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :rack_test
  end
end
