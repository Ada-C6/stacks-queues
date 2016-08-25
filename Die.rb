class Die

  def self.roll
    @die_value = rand(6) + 1
    @die_value
  end

end
