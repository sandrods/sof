module Admin
  class NoticiasController < Admin::BaseController

    crudify :noticia,
            :title_attribute => 'titulo',
            :sortable => true
            

    def index
      search_all_noticias if searching?
      paginate_all_noticias

      render :partial => 'noticias' if request.xhr?
    end

  end
end
