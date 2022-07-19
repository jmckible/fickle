class CaucusesController < ApplicationController

  def index
    @poll = Current.user.polls.find_by slug: params[:poll_id]
  end

  def create
    @poll = Current.user.polls.find_by slug: params[:poll_id]

    user = User.find_by email: params.fetch(:caucus, {}).permit(user: [:email])[:user][:email]
    unless user
      user = User.new params.fetch(:caucus, {}).permit(user: [:email, :first_name, :last_name])[:user]
      user.save!
    end
    caucus = @poll.caucuses.build user: user
    caucus.save!

    redirect_to [@poll, :caucuses], notice: 'User successfully invited. They can log in to see this poll.'
  rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotUnique
    redirect_to [@poll, :caucuses], notice: 'Sorry, there was a problem.'
  end

end
