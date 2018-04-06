require 'spec_helper'

RSpec.describe Movie do
  describe "validations" do
    it "should require a title" do
      movie = Movie.new
      expect(movie.valid?).to be false
      movie.title = "Rambo"
      expect(movie.valid?).to be true
    end
  end
end
