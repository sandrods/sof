module Admin
  class NoticiasController < Admin::BaseController

    crudify :noticia,
            :title_attribute => 'titulo',
<<<<<<< HEAD
            :sortable => false,
            :order => "data desc"
=======
            :order => "data DESC",
            :sortable => false
    
    autocomplete :tag, :name            
>>>>>>> work

    def index
      search_all_noticias if searching?
      paginate_all_noticias

      render :partial => 'noticias' if request.xhr?
    end

  end
end
