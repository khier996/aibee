class AddWechatIdToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :wechat_id, :string
  end
end
