class ListsController < ApplicationController
  def new
    # インスタンス変数（viewへ渡せる変数）@listを定義し、List.newを格納する
    @list = List.new
  end

  def create
    #フォームに記述された文字を受け取り、インスタンスを作成する
    #フォームから入力されたデータはストロングパラメータで受け取る
    list = List.new(list_params)
    #saveメソッドを実行し、上記データをデータベースに保存する
    list.save
    #トップ画面へリダイレクトする
    redirect_to '/top'
  end

  def index
    @lists = List.all
  end

  def show
  end

  def edit
  end

  #private＝ここから下はこのcontrollerの中でしか呼び出せません
  private
  #ストロングパラメータ(フォームから送られてきた悪意ある改竄データを選り分ける機能)
  #上記、cleateアクションのインスタンス(list = List.new)に引数として指定している
  def list_params
    params.require(:list).permit(:title, :body)
  end
  #list_paramsがアクションとして認識されるとURLで呼び出せてしまう(脆弱性)
  #private以下に記述することでアクションとして認識されなくなり、URLと対応しなくなる
  #privateメソッドの名前は「モデル名_params」とすることが多い
end
