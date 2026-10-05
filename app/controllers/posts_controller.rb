# Controlador para gestionar las 7 acciones REST canónicas de Post
class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts o /posts.json (Listado de publicaciones)
  def index
    @posts = Post.all
  end

  # GET /posts/1 o /posts/1.json (Detalle de una publicación específica)
  def show
  end

  # GET /posts/new (Formulario para crear una nueva publicación)
  def new
    @post = Post.new
  end

  # GET /posts/1/edit (Formulario para editar una publicación existente)
  def edit
  end

  # POST /posts o /posts.json (Persistencia de nueva publicación)
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "La publicación fue creada exitosamente." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @post.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /posts/1 o /posts/1.json (Actualización de publicación)
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "La publicación fue actualizada exitosamente.", status: :see_other }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @post.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /posts/1 o /posts/1.json (Eliminación de publicación)
  def destroy
    @post.destroy!

    respond_to do |format|
      format.html { redirect_to posts_path, notice: "La publicación fue eliminada exitosamente.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Callback para buscar el post antes de ejecutar acciones específicas
    def set_post
      @post = Post.find(params.expect(:id))
    end

    # Sanitización de parámetros permitidos (Strong Parameters)
    def post_params
      params.expect(post: [ :title, :content ])
    end
end
