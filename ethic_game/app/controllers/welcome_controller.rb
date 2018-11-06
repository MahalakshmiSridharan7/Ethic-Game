class WelcomeController < ApplicationController
  def index
    # This is default info til we get info from the db
    #@scenarioNames = ["Test Scenario", "Water Boiling Exercise", "Team Building Exercise"];
    @scenarioNames = Scenario.get_all_scenarios
  end
  
  def detail
    @scenario = params[:scenario]
  end
  
  def show
    @scenario = params[:name]
  end
end
