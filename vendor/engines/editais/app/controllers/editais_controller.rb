class EditaisController < ApplicationController

  before_filter :find_all_editais
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @edital in the line below:
    present(@page)
  end

  def show
    @edital = Edital.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @edital in the line below:
    present(@page)
  end

protected

  def find_all_editais
    @editais = Edital.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/editais")
  end

end
