class AddReposToUser < ActiveRecord::Migration
  def change
    add_column :users, :repos, :json, :array => true
 
  end
end
