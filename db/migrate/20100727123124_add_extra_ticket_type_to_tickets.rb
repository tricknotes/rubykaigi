class AddExtraTicketTypeToTickets < ActiveRecord::Migration
  def self.up
    add_column :tickets, :extra_ticket_type, :string
  end

  def self.down
    remove_column :tickets, :extra_ticket_type
  end
end
