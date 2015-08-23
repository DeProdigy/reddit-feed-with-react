class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :score
      t.string :permalink
      t.string :url
      t.string :thumbnail
      t.string :reddit_id
    end
  end
end