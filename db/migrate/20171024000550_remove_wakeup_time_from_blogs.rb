class RemoveWakeupTimeFromBlogs < ActiveRecord::Migration
  def change
    remove_column :blogs, :wakeup_time, :time
  end
end
