class ChoicesController < ApplicationController

  def show
    @choice = Current.user.choices.find params[:id]
    @poll   = @choice.poll
  end

  def create
    @poll = Current.user.polls.find_by slug: params[:poll_id]
    @choice = @poll.choices.build choice_params
    @choice.save!
    redirect_to [:edit, @poll], notice: 'Choice successfully added.'
  end

  def update
    @choice = Current.user.choices.find params[:id]
    @choice.update choice_params
    redirect_to [:edit, @choice.poll], notice: 'Choice successfully updated.'
  end

  def destroy
    @choice = Current.user.choices.find params[:id]
    @choice.destroy
    redirect_to [:edit, @choice.poll], notice: 'Choice has been deleted along with any votes cast for it.'
  end

  protected

  def choice_params
    params.fetch(:choice, {}).permit(:live, :name)
  end

end
