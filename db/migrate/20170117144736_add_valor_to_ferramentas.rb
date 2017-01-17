class AddValorToFerramentas < ActiveRecord::Migration[5.0]
  def change
    add_column :ferramentas, :valor, :decimal
  end
end
