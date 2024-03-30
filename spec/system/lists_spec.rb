# frozen_string_literal: true

require 'rails_helper'

describe：投稿のテスト
  let!：let!による事前評価
  describe：トップ画面(top_path)のテスト
    before：トップ画面への遷移
    context：表示の確認
      it：トップ画面(top_path)に「ここはTopページです」が表示されているか
        テストコード
      it：top_pathが"/top"であるか
        テストコード

  describe ：投稿画面のテスト
    before ：投稿画面への遷移
    context：表示の確認
      it ：new_list_pathが"/lists/new"であるか'
        テストコード
      it：投稿ボタンが表示されているか'
        テストコード
    context：投稿処理のテスト
      it：投稿後のリダイレクト先は正しいか
        テストコード

  describe：一覧画面のテスト
    before：一覧画面への遷移
    context ：一覧の表示とリンクの確認
      it：一覧表示画面に投稿されたものが表示されているか
        テストコード

  describe：詳細画面のテスト
    before：詳細画面への遷移
    context：表示の確認
      it：削除リンクが存在しているか
        テストコード
      it：編集リンクが存在しているか
        テストコード
    context：リンクの遷移先の確認
      it：編集の遷移先は編集画面か
        テストコード
    context：list削除のテスト
      it：listの削除
        テストコード

  describe：編集画面のテスト
    before：編集画面への遷移
    context：表示の確認
      it：編集前のタイトルと本文がフォームに表示(セット)されている
        テストコード
      it：保存ボタンが表示される
    context：更新処理に関するテスト
      it：更新後のリダイレクト先は正しいか
        テストコード