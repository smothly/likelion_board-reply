class BoardController < ApplicationController
  def index
    @list_p = Post.all
  end

  def show
    @show_p = Post.find(params[:s_id])
    
    @show_reply = @show_p.replies
  end

  def new
    
  end

  def create
    create_p = Post.new(title: params[:title], editor: params[:editor], content: params[:content])
    create_p.save
    
    redirect_to '/board/index'
  end

  def edit
    @edit_p = Post.find(params[:e_id])
  end

  def update
    @update_p = Post.find(params[:u_id])
    @update_p.title = params[:title]
    @update_p.editor = params[:editor]
    @update_p.content = params[:content]
    @update_p.save
    
    redirect_to '/board/show/' + @update_p.id.to_s
  end

  def delete
    Post.find(params[:d_id]).destroy
    redirect_to '/'
  end
end
