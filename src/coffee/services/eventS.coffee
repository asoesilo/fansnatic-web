# A service to retrieve events from the server
class EventS
  constructor: ($resource, ApiPath) ->
    events = $resource "#{ApiPath}/:id/events"

    # Return events for the specified team
    @getByTeams = (team) ->
      unless team and team.id
        throw new Error "Team object provided is missing ID property"
      events.query(id: team.id).$promise
      .then (teamEvents) ->
        # TODO: Parse team events
        return teamEvents
      .catch (err) ->
        throw new Error "Failed to retrieve events: #{err.message}"

# Add event service to mitt.app module
angular
  .module 'mitt.app'
  .service 'EventS', EventS
