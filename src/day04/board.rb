class Board

  def initialize(str)
    @cells = str.split("\n").map { |line| line.split(' ').map { |s_num| Cell.new(s_num.to_i) } }
  end

  def won
    (0...@cells.length).each do |i|
      return true if @cells[i].all?(&:marked) || @cells.map { |row| row[i] }.all?(&:marked)
    end
    false
  end

  def mark(number)
    @last_marked = number
    (0...@cells.length).each do |i|
      (0...@cells.length).each do |j|
        @cells[i][j].mark if @cells[i][j].number == number
      end
    end
  end

  class Cell
    def initialize(number)
      @number = number
      @marked = false
    end

    def mark
      @marked = true
    end

    attr_accessor :number
    attr_reader :marked
  end

  def score
    @cells.flatten.filter { !_1.marked }.map(&:number).sum * @last_marked
  end

end
