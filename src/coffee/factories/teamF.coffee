# A factory for retrieving and storing team selections
TeamF = ($q, $timeout, $http, ApiPath) ->
  TeamF = {}

  _teams = undefined
  _selectedTeam = undefined

  # Return the list of teams
  TeamF.getTeams = ->
    _teams

  # Return team selected by user
  TeamF.getSelectedTeam = ->
    _selectedTeam

  # Set the user selected team
  TeamF.selectTeam = (team) ->
    _selectedTeam = team

  # Initialize the list of teams
  TeamF.initialize = ->
    deferred = $q.defer()

    unless _teams
      $http.get "#{ApiPath}/teams"
      .success (teams) ->
        _teams = teams
        deferred.resolve()
      .error (error) ->
        # TODO: Log error
        console.error error
    else
      $timeout ->
        deferred.resolve()
      , 200

    return deferred.promise

  TeamF

# Addd team factory to mitt.app module
angular
  .module 'mitt.app'
  .factory 'TeamF', TeamF
