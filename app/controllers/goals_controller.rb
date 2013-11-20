class GoalsController < ApplicationController
  def index
  	@goals = Goal.all
  end

  def show
  	@goal = Goal.find(params[:id])
  end

  def edit
  	@goal = Goal.find(params[:id])
  end

  def update
  	@goal = Goal.find(params[:id])
  	if @goal.update_attributes(goal_params)
  		redirect_to goals_url, :notice => "Your goal 
  		was successfully updated!"
  	else
  		render "edit"
  		flash.now[:alert] = "Your goal was not updated!"
  	end
  end

  def new
  	@goal = Goal.new
  end

  def create
  	@goal = Goal.new(goal_params)
  	if @goal.save
  		redirect_to goals_url :notice => "Your goal was 
  		successfully created"
  	else 
  		render "new"
  		flash.now[:alert] = "Goal was not created"
  	end
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy	
    redirect_to goals_url :notice => "Your Goal was 
    successfully deleted"
  end

  def goal_params
  	params.require(:goal).permit(:title, :description, 
  	:martial_art, :cost, :duration)
  end

end
