class TicketsController < ApplicationController
  before_filter :login_required, :except => :show

  layout_for_latest_ruby_kaigi

  def index
    @tickets = user.tickets_of(RubyKaigi.latest_year)
  end

  def show
    @ticket = Ticket.find_by_code4url(params[:id])
    unless @ticket
      render :status => '404', :file => 'public/404.html'
    end
    @title = "#{@ticket.ticket_code}, #{I18n.t(@ticket.ticket_type)}"
  end

  def regenerate_permalink
    @ticket = Ticket.find_by_code4url(params[:id])
    unless @ticket
      render :status => '404', :file => 'public/404.html'
    end
    @ticket.update_attribute(:code4url, Ticket.generate_code4url)
    redirect_to ticket_path(@ticket)
  end
end
