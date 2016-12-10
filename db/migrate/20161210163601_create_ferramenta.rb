class CreateFerramenta < ActiveRecord::Migration[5.0]
  def change
    create_table :ferramenta do |t|
      t.string :nome
      t.text :descricao
      t.boolean :disponibilidade

      t.timestamps
    end
  end
end
