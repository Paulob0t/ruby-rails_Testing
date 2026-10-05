# Modelo Comment: Representa los comentarios asociados a un Post.
class Comment < ApplicationRecord
  # Asociación obligatoria que vincula cada comentario con un post padre (post_id)
  belongs_to :post

  # Validación de presencia para el contenido del comentario
  validates :content, presence: { message: "no puede estar en blanco" }
end
