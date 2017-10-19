class AddQuestionsToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :appearance_yn, :integer
    add_column :blogs, :arrival_yn, :integer
    add_column :blogs, :bed_time, :time
    add_column :blogs, :break_yn, :integer
    add_column :blogs, :breakfast_yn, :integer
    add_column :blogs, :dinner_time, :time
    add_column :blogs, :dinner_yn, :integer
    add_column :blogs, :enjoy_working, :integer
    add_column :blogs, :greeting_yn, :integer
    add_column :blogs, :lunch_with, :integer
    add_column :blogs, :lunch_yn, :integer
    add_column :blogs, :mor_feeling_yn, :integer
    add_column :blogs, :nomistake_yn, :integer
    add_column :blogs, :overtime_yn, :integer
    add_column :blogs, :schedule_reason, :integer
    add_column :blogs, :schedule_yn, :integer
    add_column :blogs, :wakeup_time, :time
    add_column :blogs, :worried_select, :integer
  end
end
