# A factory for retrieving and storing team selections
TeamF = ($q, $timeout, $http, ApiPath) ->
  TeamF = {}

  _teams = undefined
  _selectedTeam = undefined

  # Returns a promise that resolve with the list of teams
  TeamF.getTeams = ->
    _teams ||=
      $http.get "#{ApiPath}/teams"
      .then (res) ->
        return res.data

  # Return team selected by user
  TeamF.getSelectedTeam = ->
    _selectedTeam

  # Set the user selected team
  TeamF.selectTeam = (team) ->
    _selectedTeam = team

  TeamF

# Addd team factory to mitt.app module
angular
  .module 'mitt.app'
  .factory 'TeamF', TeamF
