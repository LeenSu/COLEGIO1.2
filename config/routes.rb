Rails.application.routes.draw do

  get 'welcome/index'

  devise_for :teachers, path_prefix: 'my'
  resources :teachers
  get 'teacher/course/:id' => 'teachers#course', as: 'teacher_course'
  get 'teacher/dashboard' => 'teachers#dashboard', as: 'teacher_dashboard'

  devise_for :students, path_prefix: 'my'
  resources :students
  get 'student/dashboard' => 'students#dashboard', as: 'student_dashboard'
  get 'student/course/:id' => 'students#course', as: 'student_course'
  get 'student/grade/:id' => 'students#grade', as: 'student_grade'
  get 'student/profile' => 'students#profile', as: 'student_profile'

  get 'student/change_grade/:id' => 'students#change_grade_student', as: 'change_grade_student'
  #   ---------RUTA------------     ------CONTROLLER#METODO-------        -----ALIAS---------

  post 'student/enroll_student' => 'students#enroll_student', as: 'enroll_student'

  devise_for :users, path_prefix: 'my'
  resources :users

  resources :scores
  get 'score/edit_for_teacher/:id' => 'scores#edit_for_teacher', as: 'edit_score_for_teacher'

  resources :courses

  resources :grades

  resources :periods

  root 'welcome#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
