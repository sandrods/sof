class Admin::CategoriasController < Admin::BaseController

  crudify :categoria,
          :title_attribute => :titulo,
          :order => 'titulo ASC'

end
