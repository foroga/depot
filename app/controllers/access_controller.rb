class AccessController < ApplicationController

  layout false

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def index
    # display text & links
    @orders = Order.select("state, date").where(id: Item.select("order_id").where(id: Request.select("item_id").where(unit_id: session[:unit_id]))).order("state")
		@openorders = Order.select("state, date").where(state: 'Open')
		@suppliers = Supplier.select("id, name").where(watcher_unit_id: session[:unit_id])
  end

  def login
    # login form
  end

  def attempt_login
    if params[:login_name].present? && params[:password].present?
      found_user = Person.where(:nickname => params[:login_name]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end
    if authorized_user
      # mark user as logged in
      session[:user_id] = authorized_user.id
      session[:user_nickname] = authorized_user.nickname
      session[:user_accesslevel] = authorized_user.accesslevel
      session[:unit_id] = authorized_user.unit_id
      flash[:notice] = "You are now logged in."
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Invalid username/password combination."
      redirect_to(:action => 'login')
    end
  end

  def logout
    # mark user as logged out
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "Logged out"
    redirect_to(:action => "login")
  end

end
