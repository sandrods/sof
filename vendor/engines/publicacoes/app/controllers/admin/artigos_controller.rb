class Admin::ArtigosController < Admin::BaseController

  crudify :artigo,
          :title_attribute => :titulo,
          :order => 'data DESC'

  before_filter :find_all_categories,
                :only => [:new, :edit, :create, :update]

protected
  def find_all_categories
    @categorias = Categoria.find(:all)
  end
end
