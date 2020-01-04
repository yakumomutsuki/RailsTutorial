class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    # id         | integer
    # name       | string
    # email      | string
    # created_at | datetime
    # updated_at | datetime
    create_table :users do |t|
      t.string :name
      t.string :email

      # t.timestampsは特別なコマンド
      # created_at / updated_atという2つのマジックカラムを作成する
      t.timestamps
    end
  end
end
