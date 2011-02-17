module Admin
  class BannersController < Admin::BaseController

    crudify :banner,
            :title_attribute => 'titulo'

    def index
      search_all_banners if searching?
      paginate_all_banners

      render :partial => 'banners' if request.xhr?
    end

  end
end
