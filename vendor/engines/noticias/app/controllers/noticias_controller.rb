class NoticiasController < ApplicationController

  before_filter :find_all_noticias
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @noticia in the line below:
    present(@page)
  end

  def show
    @noticia = Noticia.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @noticia in the line below:
    present(@page)
  end

protected

  def find_all_noticias
    @noticias = Noticia.order("data DESC").limit(10).all
  end

  def find_page
    @page = Page.find_by_link_url("/noticias")
  end

end
