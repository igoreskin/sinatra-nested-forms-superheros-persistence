require 'sinatra/base'
require 'pry'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/teams' do
      @teams = Team.all

      erb :index
    end

    get '/teams/:id' do
      @team = Team.find(params[:id])

      erb :show_team
    end

    get '/new' do
      erb :new_team
    end

    post '/teams' do
    if Team.find_by(name: params[:team][:name])
      redirect to '/error'
    else
      team = Team.create(name: params[:team][:name], motto: params[:team][:motto])

      params[:team][:super_heros].each do |details|
          super_hero = SuperHero.new(details)
          super_hero.team = team
          super_hero.save unless SuperHero.find_by(name: super_hero.name)
        end

      redirect to "/teams/#{team.id}"
    end
  end

    get '/error' do
      resp.write "<h1>ERROR TEAM EXISTS!!!</h1>"
    end


end
