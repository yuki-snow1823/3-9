Rails.application.routes.draw do
  get 'todolists/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'top' => 'homes#top'
  #URL[top]にアクセスした時に,homesコントローラーのtopアクションが呼び出される
  #そしてビューファイルの名前は、アクション名と同じにすること
  post 'todolists' => 'todolists#create'

  get 'todolists' => 'todolists#index'

  get 'todolists/:id' => 'todolists#show', as: 'todolist'
  #【重要】todolists#showの設定を、todolistとして利用できるという意味
  # .../todolists/1 や .../todolists/3 に該当する
  #非常に便利、一個一個指定はしなくていい
  get 'todolists/:id/edit' => 'todolists#edit', as: 'edit_todolist'
  #このasについては必ず確認する
  patch 'todolists/:id' => 'todolists#update', as: 'update_todolist'
  delete 'todolists/:id' => 'todolists#destroy', as: 'destroy_todolist'
end
