class PostsController < ActionController::Base
  
  def index
    @posts = Post.all
    
    respond_to do |format|
      format.html
      format.xml { render :xml => @posts }
    end
  end
  
  def create
    @post = Post.new(params[:post])
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to(@post, :notice => 'Success!') }
        format.xml { render :xml => @post, :status => :created, :location => @post }
        
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def new
    @post = post.new
    
    respond_to do |format|
      format.html
      format.xml { render :xml => @post }
    end
  end
  
  def edit
    @post = Post.find(prams[:id])
  end
  
  def show
    @post = Post.find(params[:id])

     respond_to do |format|
       format.html
       format.xml { render :xml => @post }
     end
  end
  
  def update
    @post = Post.find(params[:id])
    
    respond_to do |format|
      if @post.update_attributes(parans[:post])
        format.html { redirect_to(@post, :notice => "Success!") }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    
    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml { head :ok }
    end
  end
end