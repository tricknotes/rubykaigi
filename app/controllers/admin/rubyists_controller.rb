class Admin::RubyistsController < Admin::Base
  admin_assistant_for Rubyist do |config|
    config.actions << :destroy
    config.index.sort_by :username
  end
end
