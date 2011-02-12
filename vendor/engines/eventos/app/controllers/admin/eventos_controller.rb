module Admin
  class EventosController < Admin::BaseController

    crudify :evento,
            :title_attribute => 'titulo'

    def index
      search_all_eventos if searching?
      paginate_all_eventos

      render :partial => 'eventos' if request.xhr?
    end

  end
end
