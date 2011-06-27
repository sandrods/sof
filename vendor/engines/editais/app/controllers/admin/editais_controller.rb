module Admin
  class EditaisController < Admin::BaseController

    crudify :edital,
            :title_attribute => 'titulo',
            :order => 'data desc',
            :sortable => false
          
    def index
      search_all_editais if searching?
      paginate_all_editais

      render :partial => 'editais' if request.xhr?
    end

  end
end
