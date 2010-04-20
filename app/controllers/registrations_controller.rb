class RegistrationsController < ApplicationController
  def index
    @individual_sponsor = ProductItem.find_by_item_code('rk10_individual_sponsor')
  end
end
