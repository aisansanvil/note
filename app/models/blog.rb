class Blog < ActiveRecord::Base
  validates :title, :content, :dinner_yn, :mor_feeling_yn, :breakfast_yn, :appearance_yn, :arrival_yn, :greeting_yn, :lunch_yn, :lunch_with, :break_yn, :schedule_yn, :nomistake_yn, :overtime_yn, :enjoy_working, :worried_select, presence: true
  belongs_to :user
  # CommentモデルのAssociationを設定
  has_many :comments, dependent: :destroy

  mount_uploader :picture, PictureUploader

  include CsvExportable

end
