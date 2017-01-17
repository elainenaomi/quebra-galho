class EmprestimoHabilidade < ApplicationRecord
  belongs_to :usuario
  belongs_to :habilidade
end
