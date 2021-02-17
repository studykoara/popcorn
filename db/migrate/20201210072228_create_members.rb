class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :name, null: false  # ユーザー名 null保存でエラーを起こすp181
      t.string :full_name  # 本名
      t.integer :sex, null: false, default: 0 # 性別 (0:男, 1:女)
      t.date :birthday # 生年月日
      t.string :mail  # メールアドレス
      t.string :password_digest # パスワード
      t.string :credit_number # クレジットカード番号
      t.date :expiration_date # クレジットカードの有効期限
      t.integer :authentication_number # クレジットカードの認証コード
      t.boolean :administrator, null: false, default: false # 管理者フラグ (true:管理者, false:一般ユーザー)

      t.timestamps
    end
  end
end
