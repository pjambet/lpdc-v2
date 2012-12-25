Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :gold_books, path: 'livre_dor' do
    resources :gold_books, path: '', only: [:index, :create]
  end

  # Admin routes
  namespace :gold_books, path: '' do
    namespace :admin, path: 'refinery' do
      resources :gold_books, except: :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
