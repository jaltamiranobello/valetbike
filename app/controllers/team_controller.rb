class TeamController < ApplicationController
    def index
      @team_members = [
        { name: "Alice", email: "alice@example.com", info: "Information about Alice" },
        { name: "Bob", email: "bob@example.com", info: "Information about Bob" },
        { name: "Charlie", email: "charlie@example.com", info: "Information about Charlie" },
        # Add more team members as needed
      ]
    end
  end
  