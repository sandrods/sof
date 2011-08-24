module Admin
  class TextosController < Admin::BaseController

    crudify :texto,
            :title_attribute => 'titulo'

    def index
      search_all_textos if searching?
      paginate_all_textos

      render :partial => 'textos' if request.xhr?
    end

  end
end
