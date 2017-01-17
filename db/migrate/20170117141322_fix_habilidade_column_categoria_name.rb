class FixHabilidadeColumnCategoriaName < ActiveRecord::Migration[5.0]
  def change
    rename_column :habilidades, :categoria_id_id, :categoria_id
  end
end
