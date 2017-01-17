json.extract! emprestimo_habilidade, :id, :usuario_id, :habilidade_id, :created_at, :updated_at
json.url emprestimo_habilidade_url(emprestimo_habilidade, format: :json)