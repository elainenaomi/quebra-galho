class EmprestimoFerramenta < ApplicationRecord
  belongs_to :usuario
  belongs_to :ferramenta
end
