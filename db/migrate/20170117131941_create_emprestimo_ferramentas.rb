class CreateEmprestimoFerramentas < ActiveRecord::Migration[5.0]
  def change
    create_table :emprestimo_ferramentas do |t|
      t.references :usuario, foreign_key: true
      t.references :ferramenta, foreign_key: true

      t.timestamps
    end
  end
end
