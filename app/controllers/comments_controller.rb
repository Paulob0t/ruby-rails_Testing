# Controlador para gestionar los comentarios asociados a un Post
class CommentsController < ApplicationController
  before_action :set_post

  # POST /posts/:post_id/comments
  def create
    @comment = @post.comments.build(comment_params)

    if @comment.save
      redirect_to @post, notice: "El comentario fue creado exitosamente."
    else
      # Redirección con alerta en caso de fallo de validación
      redirect_to @post, alert: "No se pudo guardar el comentario: " + @comment.errors.full_messages.to_sentence
    end
  end

  # DELETE /posts/:post_id/comments/:id
  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy!

    redirect_to @post, notice: "El comentario fue eliminado exitosamente.", status: :see_other
  end

  private

  # Callback para encontrar la publicación padre a través del parámetro post_id de la URL
  def set_post
    @post = Post.find(params[:post_id])
  end

  # Sanitización de parámetros permitidos para Comment (Strong Parameters)
  def comment_params
    params.require(:comment).permit(:author, :content)
  end
end
