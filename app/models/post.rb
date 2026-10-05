# Modelo Post: Representa las publicaciones principales en el laboratorio.
class Post < ApplicationRecord
  # Relación uno a muchos con Comment. Si se elimina un post, se eliminan sus comentarios asociados en cascada.
  has_many :comments, dependent: :destroy

  # Validaciones de presencia para asegurar la integridad de los datos
  validates :title, presence: { message: "no puede estar en blanco" }
  validates :content, presence: { message: "no puede estar en blanco" }
end
