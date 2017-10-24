class RemoveDinnerTimeFromBlogs < ActiveRecord::Migration
  def change
    remove_column :blogs, :dinner_time, :time
  end
end
