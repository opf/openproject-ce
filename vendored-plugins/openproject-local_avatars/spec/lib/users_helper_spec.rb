require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

class UsersHelperTest
  include UsersHelper
end

describe UsersHelperTest do
  describe "#user_settings_tabs" do
    subject {UsersHelperTest.new.user_settings_tabs}
    it { is_expected.to include({:name => 'avatar', :partial => 'users/avatar', :label => :label_avatar}) }
  end
end
