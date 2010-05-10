class RegistrationsController < ApplicationController
  layout_for_latest_ruby_kaigi

  def index
    @individual_sponsor = ProductItem.find_by_item_code('rk10_individual_sponsor')
  end
end
