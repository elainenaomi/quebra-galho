class Habilidade < ApplicationRecord
	belongs_to :usuario
	belongs_to :categoria
end
