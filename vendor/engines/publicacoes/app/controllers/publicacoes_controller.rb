class PublicacoesController < ApplicationController

  helper :blog_posts
  before_filter :find_page, :find_all_categories

protected

  def find_page
    @page = Page.find_by_link_url("/publicacoes")
  end

  def find_all_categories
    @categorias = Categoria.all
  end

end
