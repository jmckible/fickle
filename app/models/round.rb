class Round

  attr_accessor :already_eliminated, :in_the_running, :number, :poll, :results, :tally

  def initialize(tally, number, in_the_running, already_eliminated)
    self.tally  = tally
    self.number = number
    self.in_the_running = in_the_running
    self.already_eliminated = already_eliminated

    solve
  end

  def solve
    @results = {}
    @in_the_running.each do |choice|
      count = 0
      @tally.ballots.each do |ballot|
        if ballot.rankings.where.not(choice: @already_eliminated).any?
          if ballot.rankings.where.not(choice: @already_eliminated).first.choice == choice
            count = count + 1
          end
        end
      end
      @results[choice] = count
    end
    @results = @results.sort_by(&:last).reverse
  end

  def winner_selected?
    return true if @results.none?
    @results.first.last > (@tally.ballots.count / 2.0)
  end

  def leader
    @results.first&.first
  end

  def lowest_count
    @results.last.last
  end

  def newly_eliminated
    @results.select{|r| r.last <= lowest_count}.collect(&:first)
  end

end
