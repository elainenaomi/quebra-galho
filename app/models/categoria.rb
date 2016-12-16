class Categoria < ApplicationRecord
  has_many :ferramentas
  has_many :habilidades
end
