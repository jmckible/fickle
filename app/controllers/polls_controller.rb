class PollsController < ApplicationController

  def index
  end

  def show
    @poll = Current.user.polls.find_by slug: params[:id]
  end

  def edit
    @poll = Current.user.polls.find_by slug: params[:id]
  end

  def new
    @poll = Poll.new
  end

  def create
    @poll = Current.user.created_polls.build poll_params
    @poll.save!
    caucus = Current.user.caucuses.build poll: @poll
    caucus.save!
    redirect_to root_url, notice: 'Poll created'
  end

  protected

  def poll_params
    params.fetch(:poll, {}).permit(:name, :slug)
  end

end
