Rails.application.routes.draw do
  resources :categories do
    resources :todos
  end
  root "categories#index"  # ตั้งค่าให้หน้าแรกเป็นหน้าหมวดหมู่
end
