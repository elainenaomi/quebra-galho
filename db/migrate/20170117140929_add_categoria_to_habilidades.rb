class AddCategoriaToHabilidades < ActiveRecord::Migration[5.0]
  def change
    add_reference :habilidades, :categoria_id, references: :categorias, index: true
  end
end
