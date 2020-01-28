class TodolistsController < ApplicationController
  def new
    #viewへ渡すためのインスタンス変数にからのモデルオブジェクトを生成する
    #@listに深い意味はない。インスタンス変数の名前。
    @list = List.new
  end

  def create
    # このlistって何→新規登録するためのインスタンス（引数:list_params)
    # 急に出てきた引数もよく分からない:newに引数？？
    list = List.new(list_params)

    list.save

    redirect_to todolist_path(list.id)
    # 詳細画面へリダイレクト
    # 投稿後すぐに何を書いたかブログのように見せるため
  end

  def index
    # 全てのデータをこのインスタンス変数に入れる。意味合いを考えて複数形に。
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    #findメソッドを使って、データベースから取得し、@listへ格納する。
  end

  def edit
    @list = List.find(params[:id])
    #showと同じことを行う
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)
    
  end

  def destroy
    list = List.find(params[:id]) #データ(レコード)を1件取得
    list.destroy #データ（レコード）を削除
    redirect_to todolists_path #List一覧画面へリダイレクト
  end

  private

  def list_params
    # paramsはデータを受け取る、requireで「どこの」permitでキーを指定（何を取るか）
    params.require(:list).permit(:title, :body, :image)

  end
end
