class TextosController < ApplicationController

  before_filter :find_all_textos
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @texto in the line below:
    present(@page)
  end

  def show
    @texto = Texto.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @texto in the line below:
    present(@page)
  end

protected

  def find_all_textos
    @textos = Texto.find(:all, :order => "position ASC").paginate(:page => (params[:page]||1), :per_page => 10)
  end

  def find_page
    @page = Page.find_by_link_url("/textos")
  end

end
