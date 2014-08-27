Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :events do
    resources :events, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :events, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :events, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end


  # Frontend routes
  namespace :events do
    resources :event_categories, :only => [:index, :show]
  end

  # Admin routes
  namespace :events, :path => '' do
    namespace :admin, :path => "#{Refinery::Core.backend_route}/events" do
      resources :event_categories, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end


  # Frontend routes
  namespace :events do
    resources :attendees, :only => [:index, :show]
  end

  # Admin routes
  namespace :events, :path => '' do
    namespace :admin, :path => "#{Refinery::Core.backend_route}/events" do
      resources :attendees, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
