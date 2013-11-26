class GoalsController < ApplicationController
  before_filter :signed_in?, :only => [:new, :create, :edit, :update, :destroy]
  before_filter :load_goal, :only => [:show, :update, :edit, :destroy]
  before_filter :correct_user, :only => [:edit]

  def index
  	@goals = Goal.all
  end

  def show
  end

  def edit
  end

  def update
  	if @goal.update_attributes(goal_params)
  		redirect_to goals_url, :notice => "Your goal 
  		was successfully updated!"
  	else
  		render "edit"
  		flash.now[:alert] = "Your goal was not updated!"
  	end
  end

  def new
    unless session[:user_id] 
      redirect_to goals_url, :notice => "You need to sign in"
    else
  	   @goal = Goal.new
    end
  end

  def create
    @goal = current_user.build_goal(goal_params) 
  	if @goal.save
  		redirect_to goals_url :notice => "Your goal was 
  		successfully created"
  	else 
  		render "new"
  		flash.now[:alert] = "Goal was not created"
  	end
  end

  def destroy
    @goal.destroy	
    redirect_to goals_url :notice => "Your Goal was 
    successfully deleted"
  end

  def goal_params
  	params.require(:goal).permit(:title, :description, 
  	:martial_art, :cost, :duration)
  end

  def load_goal
     @goal = Goal.find(params[:id])
  end

  def correct_user
    if current_user != @goal.user
      redirect_to users_url
    end
  end

end
