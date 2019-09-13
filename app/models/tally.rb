class Tally

  attr_accessor :ballots, :poll, :rounds, :weighted

  def initialize(ballots)
    self.ballots = ballots
    self.poll    = ballots.first.poll

    calculate_rounds
    calculate_weighted
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

  def calculate_weighted
    @weighted = {}

    weight = @poll.choices.count

    @poll.choices.each do |choice|
      @weighted[choice] = 0
    end

    @ballots.each do |ballot|
      ballot.rankings.each do |ranking|
        @weighted[ranking.choice] = @weighted[ranking.choice] + (weight - ranking.position - 1)
      end
    end

    @weighted = @weighted.sort_by(&:last).reverse
  end

end
