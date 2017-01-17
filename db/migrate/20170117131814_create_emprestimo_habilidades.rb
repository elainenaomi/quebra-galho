class CreateEmprestimoHabilidades < ActiveRecord::Migration[5.0]
  def change
    create_table :emprestimo_habilidades do |t|
      t.references :usuario, foreign_key: true
      t.references :habilidade, foreign_key: true

      t.timestamps
    end
  end
end
