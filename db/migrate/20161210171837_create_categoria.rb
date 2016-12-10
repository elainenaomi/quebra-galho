class CreateCategoria < ActiveRecord::Migration[5.0]
  def change
    create_table :categoria do |t|
      t.string :nome
      t.text :descricao

      t.timestamps
    end
  end
end
