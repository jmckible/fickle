class ChoicesController < ApplicationController

  def show
    @choice = Current.user.choices.find params[:id]
    @poll   = @choice.poll
  end

  def create
    @poll = Current.user.polls.find_by slug: params[:poll_id]
    @choice = @poll.choices.build choice_params
    @choice.save!
    redirect_to @poll, notice: 'Choice added'
  end

  def update
    @choice = Current.user.choices.find params[:id]
    @choice.update_attributes! choice_params
    redirect_to @choice.poll, notice: 'Choice updated'
  end

  protected

  def choice_params
    params.fetch(:choice, {}).permit(:live, :name)
  end

end
