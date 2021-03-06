class EventosController < ApplicationController

  before_filter :find_all_eventos
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @evento in the line below:
    present(@page)
  end

  def show
    @evento = Evento.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @evento in the line below:
    present(@page)
  end

protected

  def find_all_eventos
    @eventos = Evento.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/eventos")
  end

end
