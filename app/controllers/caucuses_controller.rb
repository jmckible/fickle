class CaucusesController < ApplicationController

  def create
    @poll = Current.user.polls.find_by slug: params[:poll_id]

    user = User.find_by email: params.fetch(:caucus, {}).permit(user: [:email])[:user][:email]
    if user
      caucus = @poll.caucuses.build user: user
      caucus.save!
    end

    redirect_to @poll, notice: 'User invited'
  end

end
