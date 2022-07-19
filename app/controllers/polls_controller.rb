class PollsController < ApplicationController

  def index
  end

  def show
    @poll = Current.user.polls.find_by slug: params[:id]
    @last_ballot = Current.user.ballots.for(@poll).includes(rankings: :choice).newest_first.first
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
    redirect_to @poll, notice: 'New poll created. Now add some choices.'
  end

  def update
    @poll = Current.user.polls.find_by slug: params[:id]
    @poll.update poll_params
    redirect_to [:edit, @poll], notice: 'Poll successfully updated.'
  end

  protected

  def poll_params
    params.fetch(:poll, {}).permit(:live, :name, :slug)
  end

end
