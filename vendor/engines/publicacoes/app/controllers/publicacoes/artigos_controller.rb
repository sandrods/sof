class Publicacoes::ArtigosController < BlogController

  before_filter :find_all_blog_posts
  before_filter :find_blog_post, :only => [:show, :update_nav]

  respond_to :html, :js, :rss

  def index
    respond_with (@artigos) do |format|
      format.html
      format.rss
    end
  end

  def show

    respond_with (@artigo) do |format|
      format.html { present(@page) }
      format.js { render :partial => 'artigo', :layout => false }
    end
  end


protected

  def find_artigo
    unless (@artigo = Artigo.find(params[:id])).try(:live?)
      if refinery_user? and current_user.authorized_plugins.include?("refinerycms_publicacoes")
        @artigo = Artigo.find(params[:id])
      else
        error_404
      end
    end
  end

  def find_all_artigos
    @artigos = Artigo.live.includes(:categoria).paginate({
      :page => params[:page],
      :per_page => RefinerySetting.find_or_set(:publicacoes_per_page, 10)
    })
  end

end
