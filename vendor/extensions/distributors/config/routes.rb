Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :distributors, path: 'distributeurs' do
    resources :distributors, path: '', only: :index
  end

  # Admin routes
  namespace :distributors, path: '' do
    namespace :admin, path: 'refinery' do
      resources :distributors, except: :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
