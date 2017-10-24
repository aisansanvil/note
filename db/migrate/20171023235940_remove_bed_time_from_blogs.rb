class RemoveBedTimeFromBlogs < ActiveRecord::Migration
  def change
    remove_column :blogs, :bed_time, :time
    remove_column :blogs, :dinner_time, :time
    remove_column :blogs, :wakeup_time, :time
  end
end
