class BallotsController < ApplicationController

  def create
    @poll = Current.user.polls.find_by slug: params[:poll_id]
    @ballot = Current.user.ballots.build poll: @poll

    @ballot.save!

    ballot_params[:rankings].each_with_index do |hash, i|
      ranking = @ballot.rankings.build choice: @poll.choices.find(hash[:choice_id]), position: (i + 1)
      ranking.save!
    end

    redirect_to @poll, notice: 'Ballot cast'
  end

  protected

  def ballot_params
    params.fetch(:ballot, {}).permit(rankings: [:choice_id])
  end

end
