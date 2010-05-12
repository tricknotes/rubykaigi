class IndividualSponsorOption < ActiveRecord::Base
  belongs_to :order_item

  validates_presence_of :link_label, :if => :link_information_given?
  validates_presence_of :link_url, :if => :link_information_given?

  validates_numericality_of :additional_amount, :greater_than_or_equal_to => 0, :only_integer => true
  validates_length_of :link_label, :maximum => 128, :allow_blank => true
  validates_length_of :link_url, :maximum => 255, :allow_blank => true

  private
  def link_information_given?
    link_url.present? || link_label.present?
  end
end
