Rails.application.routes.draw do
  get 'lists/new'
  post 'lists' => 'lists#create'

  get 'lists' => 'lists#index'

  get 'lists/:id/edit' => 'lists#edit', as: 'edit_list'

  get '/top' => 'homes#top'

  #List.find(1) #listsテーブルの中にあるidが1のレコードを取得
  #/lists/1    => List.find(params[:id]) => idが1のレコードを取得
  get 'lists/:id' => 'lists#show', as: 'list'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
