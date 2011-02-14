class CategoriasController < PublicacoesController

  def show
    @categoria = Categoria.find(params[:id])
  end

end
