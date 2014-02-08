class StaticPagesController < ApplicationController
 def home
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
    @jobs = Job.all.paginate(page: params[:page])
  end
  
  def help
  end

  def about
  end

  def contact
  end
end
