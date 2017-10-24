class BlogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :download]

  def index
    @blogs = Blog.all.order('id DESC')
  end

  def export_csv
    @blogs = Blog.all
    send_data @blogs.to_csv, filename: "#{Time.current.strftime('%Y%m%d')}.csv"
  end

  def new
    if params[:back]
      @blog = Blog.new(blogs_params)
    else
      @blog = Blog.new
    end
  end

  def create
    @blog = Blog.new(blogs_params)
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to blogs_path, notice: "My Noteを投稿しました！"
      NoticeMailer.sendmail_blog(@blog).deliver
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @blog.update(blogs_params)
      redirect_to blogs_path, notice: "My Noteを更新しました"
    else
      render 'edit'
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: "My Noteを削除しました"
  end

  def confirm
    @blog = Blog.new(blogs_params)
    render :new if @blog.invalid?
  end

  # showアククションを定義します。入力フォームと一覧を表示するためインスタンスを2つ生成します。
  def show
    @comment = @blog.comments.build
    @comments = @blog.comments
    Notification.find(params[:notification_id]).update(read: true) if params[:notification_id]
  end


  private
  def blogs_params
    params.require(:blog).permit(:title, :content, :picture, :dinner_yn, :mor_feeling_yn, :breakfast_yn, :appearance_yn, :arrival_yn, :greeting_yn, :lunch_yn, :lunch_with, :break_yn, :schedule_yn, :schedule_reason, :nomistake_yn, :overtime_yn, :enjoy_working, :worried_select, :picture_cache,)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

end
