class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :github_name
      t.string :avatar_url
      t.string :followers
      t.string :following
      t.string :public_repos

      t.timestamps
    end
  end
end
