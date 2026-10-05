Rails.application.routes.draw do
  # Rutas RESTful jerárquicas: Los comentarios se anidan dentro de cada publicación
  # limitando las acciones únicamente a creación (:create) y eliminación (:destroy)
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  # Endpoint para health check de la aplicación
  get "up" => "rails/health#show", as: :rails_health_check

  # Ruta raíz por defecto (opcional)
  # root "posts#index"
end
