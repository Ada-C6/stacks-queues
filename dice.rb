module TempByDesignInc
  class Dice
    attr_accessor :show_side
    def initialize
      @show_side = show_side
    end

    # Originally included dice functionality within the HR class;
    # Broke it out into its own class once the program was working as expected as I had time to do so
    def self.roll
      show_side = rand(1..6)
      return show_side
    end

  end
end
