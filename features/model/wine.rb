class Wine
  attr_reader :title, :state, :country

  def initialize(title, state, country)
    @title = title
    @state = state
    @country = country
  end
end
