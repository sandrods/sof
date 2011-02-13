class Publicacoes::CategoriasController < BlogController

  def show
    @categoria = Categoria.find(params[:id])
  end

end
