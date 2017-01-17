class EmprestimosController < ApplicationController
  before_action :verify_user_login

  def index
    @logged_user = logged_user
    #preload(@logged_user, :favorite_bugs, :favorite_projects)
    @emprestimos_ferramentas = @logged_user.emprestimos_ferramentas
    #preload(@favorite_bugs, :bug)
    @emprestimos_habilidades = @logged_user.emprestimos_habilidades
    #preload(@favorite_projects, :project)
  end

  def criar_emprestimos_ferramenta
    ferramenta = Ferramenta.find_by_id(params[:id])
    if ferramenta.nil?
      flash[:notice] = "Ferramenta não existe"
    else
      if logged_user.add_favorite_bug(bug)
        flash[:notice] = "Ferramenta foi adicionada ao emprestimos"
      else
        flash[:notice] = "Ferramenta já emprestada"
      end
    end
    redirect_to_back
  end

  def criar_emprestimos_habilidade
    habilidade = Habilidade.find_by_id(params[:id])
    if habilidade.nil?
      flash[:notice] = "Habilidade não existe"
    else
      if logged_user.add_favorite_project(project)
        flash[:notice] = "Habilidade foi adicionada ao emprestimos"
      else
        flash[:notice] = "Habilidade já sendo utilizada"
      end
    end
    redirect_to_back
  end

  def destruir_emprestimos_ferramenta
    favorite = FavoriteProject.find(params[:id])
    if favorite.user == logged_user
      if favorite.destroy
        flash[:notice] = "Ferramenta foi removida ao emprestimos"
      else
        flash[:notice] = "Ferramenta não pôde ser removida do emprestimos"
      end
    end
    redirect_to_back
  end

  def destruir_emprestimos_habilidade
    favorite = FavoriteBug.find(params[:id])
    if favorite.user == logged_user
      if favorite.destroy
        flash[:notice] = "Habilidade foi removida ao emprestimos"
      else
        flash[:notice] = "Bug can't be removed from Favorites"
      end
    end
    redirect_to_back
  end

  def toggle_favorite_bug
    favorite = logged_user.reload.favorite_bugs.find_by_bug_id(params[:id])
    if favorite
      params[:id] = favorite.id
      destroy_favorite_bug
    else
      create_favorite_bug
    end
  end

  def toggle_favorite_project
    favorite = logged_user.reload.favorite_projects.find_by_project_id(params[:id])
    if favorite
      params[:id] = favorite.id
      destroy_favorite_project
    else
      create_favorite_project
    end
  end

  def delete_all_favorite_bugs
    if logged_user.favorite_bugs.size == 0
      flash[:notice] = "There's nothing to erase"
    else
    logged_user.favorite_bugs.each(&:destroy)
    end
    redirect_to_back
  end

  def delete_all_favorite_projects
    if logged_user.favorite_projects.size == 0
      flash[:notice] = "There's nothing to erase"
    else
    logged_user.favorite_projects.each(&:destroy)
    end
    redirect_to_back
  end

  private

  def redirect_to_back
    redirect_back(fallback_location: root_path)
  end
end
