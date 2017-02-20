class CreateArticles < ActiveRecord::Migration
  def up
    create_table :articles do |t|
      t.string :title
    end
  end

  def down
  end
end
