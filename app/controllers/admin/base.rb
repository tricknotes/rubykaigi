class Admin::Base < ApplicationController
  before_filter :staff_only
  layout 'admin'
end
