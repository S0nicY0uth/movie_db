require 'spec_helper'

RSpec.describe "/movies" do

  describe "viewing a movie" do

    before do
      @movie = Movie.create!(title: "Rambo", year: 1982, description: "Sylvester Stallone goes mental in the woods")
    end

    it "should show the movie title" do
      get "/movies/#{@movie.id}"
      expect(last_response.body).to include @movie.title
    end

    it "should show the movie description and year" do
      get "/movies/#{@movie.id}"
      expect(last_response.body).to include @movie.year.to_s
      expect(last_response.body).to include @movie.description
    end

    it "should show a list of genres for the movie" do
      @movie.genres << Genre.create!(name: "Action")
      @movie.genres << Genre.create!(name: "War")
      get "/movies/#{@movie.id}"
      expect(last_response.body).to include "Action"
      expect(last_response.body).to include "War"
    end

  end
  
  describe "adding a movie" do
    it "should add a movie" do
      post '/movies', movie: {title: "Rambo", year: 1982, description: "Sylvester Stallone goes mental in the woods"}
      expect(last_response.status).to eq(302)
      @movie = Movie.find_by(title: "Rambo")
      expect(@movie.year).to eq(1982)
    end
  end
  
end
