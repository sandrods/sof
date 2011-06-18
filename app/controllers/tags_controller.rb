class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @noticias = Noticia.tagged_with(@tag.name)
    @eventos = Evento.tagged_with(@tag.name)
    @artigos = Artigo.tagged_with(@tag.name)
  end
end
