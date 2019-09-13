class Tally

  attr_accessor :ballots, :poll, :rounds

  def initialize(ballots)
    self.ballots = ballots
    self.poll    = ballots.first.poll

    calculate_rounds
  end

  def calculate_rounds
    @rounds = []

    solve = true
    number = 1
    in_the_running = @poll.choices
    already_eliminated = []

    while solve
      round = Round.new(self, number, in_the_running, already_eliminated)
      @rounds << round

      number = number + 1
      in_the_running = in_the_running - round.newly_eliminated
      already_eliminated = already_eliminated + round.newly_eliminated

      solve = false if round.winner_selected? || number > @poll.choices.count
    end


    @rounds
  end

end
