class ArtigosController < PublicacoesController

    before_filter :find_all_artigos
    before_filter :find_page

    def index
      present(@page)
    end

    def show
      @artigo = Artigo.find(params[:id])

      # you can use meta fields from your model instead (e.g. browser_title)
      # by swapping @page for @noticia in the line below:
      present(@page)
    end

  protected

    def find_all_artigos
      @artigos = Artigo.order("data DESC").limit(10).all
    end

    def find_page
      @page = Page.find_by_link_url("/artigos")
    end

end
