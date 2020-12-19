class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :user, foreign_key: true  #マイグレーションファイル内の t.references = 別のテーブルを参照させる
      t.references :follow, foreign_key: { to_table: :users }  #{ to_table: :users } オプション = 外部キーとしてusersテーブルを参照する指定

      t.timestamps

      t.index [:user_id, :follow_id], unique: true
      #user_id と follow_id のペアで重複するものが保存されないようにするデータベースの設定
    end
  end
end
