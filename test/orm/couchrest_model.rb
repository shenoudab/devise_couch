require 'rails/test_help'

class ActiveSupport::TestCase
  setup do
    TEST_SERVER.default_database.recreate!
  end
end
