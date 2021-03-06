class NoticiasController < ApplicationController

  before_filter :find_page

  def index
    if params[:filtro].present?
      @noticias = Noticia.with_query(params[:filtro]).order("data DESC").paginate(:page => (params[:page]||1), :per_page => 10)
    else
      find_all_noticias
    end
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @noticia in the line below:
    present(@page)
  end

  def show
    find_all_noticias
    @noticia = Noticia.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @noticia in the line below:
    present(@page)

    @meta_description = @noticia.detalhe
    @meta_title = @noticia.titulo
  end

protected

  def find_all_noticias
    @noticias = Noticia.order("data DESC").paginate(:page => (params[:page]||1), :per_page => 10)
  end

  def find_page
    @page = Page.find_by_link_url("/noticias")
  end

end
