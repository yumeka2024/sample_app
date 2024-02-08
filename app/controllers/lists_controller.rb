class ListsController < ApplicationController
  def new
    # インスタンス変数（viewへ渡せる変数）@listを定義し、List.newを格納する
    @list = List.new
  end

  def create
    #フォームに記述された文字を受け取り、インスタンスを作成する
    #フォームから入力されたデータはストロングパラメータで受け取る
    @list = List.new(list_params)
    #saveメソッドを実行し、上記データをデータベースに保存する
    if @list.save
      #保存できた場合は、Flashメッセージを下記に定義する
      flash[:notice] = "投稿に成功しました。"
      #今保存した投稿データの詳細画面へリダイレクトする
      redirect_to list_path(@list.id)
    else
      # 保存できなかった場合は、Flashメッセージを下記に定義する
      flash.now[:alert] = "投稿に失敗しました。"
      # URLの末尾を「/new」とする
      render :new
    end
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end
  
  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to '/lists'
  end

  #private＝ここから下はこのcontrollerの中でしか呼び出せません
  private
  #ストロングパラメータ(フォームから送られてきた悪意ある改竄データを選り分ける機能)
  #上記、cleateアクションのインスタンス(list = List.new)に引数として指定している
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
  #list_paramsがアクションとして認識されるとURLで呼び出せてしまう(脆弱性)
  #private以下に記述することでアクションとして認識されなくなり、URLと対応しなくなる
  #privateメソッドの名前は「モデル名_params」とすることが多い
end
