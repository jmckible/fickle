class BallotsController < ApplicationController

  def index
    @poll = Current.user.polls.find_by slug: params[:poll_id]
    redirect_to @poll and return unless @poll.ballots.any?
    @ballots = @poll.ballots.where(user: Current.user).newest_first
    @tally = Tally.new @ballots
  end

  def create
    @poll = Current.user.polls.find_by slug: params[:poll_id]
    @ballot = Current.user.ballots.build poll: @poll

    @ballot.save!

    ballot_params[:rankings].each_with_index do |hash, i|
      ranking = @ballot.rankings.build choice: @poll.choices.find(hash[:choice_id]), position: (i + 1)
      ranking.save!
    end

    redirect_to @poll, notice: 'Ballot successfully cast!'
  end

  def destroy
    @ballot = Current.user.ballots.find params[:id]
    @ballot.destroy
    redirect_to [@ballot.poll, :ballots], notice: 'Ballot successfully deleted.'
  end

  protected

  def ballot_params
    params.fetch(:ballot, {}).permit(rankings: [:choice_id])
  end

end
