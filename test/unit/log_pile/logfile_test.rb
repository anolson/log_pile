require 'test_helper'

module LogPile
  class LogfileTest < ActiveSupport::TestCase
    test "permalink generation" do
      logfile = Logfile.create(:name => "System log", :path => "/var/log/system.log")
      assert_equal "system_log", logfile.permalink
    end
  end
end
