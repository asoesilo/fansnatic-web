describe 'Event service |', ->
  beforeEach module 'mitt.app'

  beforeEach inject ($injector) ->
    @EventS = $injector.get 'EventS'
    @HttpBackend = $injector.get '$httpBackend'
    @ApiPath = $injector.get 'ApiPath'

  afterEach ->
    @HttpBackend.verifyNoOutstandingExpectation()
    @HttpBackend.verifyNoOutstandingRequest()

  describe 'getByTeams() |', ->
    it 'retrieve the list of events from the server', ->
      team =
        id: 1

      response = [
        id: 1
        title: 'Mavs vs Kings'
      ,
        id: 2
        title: 'Mavs vs Lakers'
      ]

      @HttpBackend.expect 'GET', "#{@ApiPath}/#{team.id}/events"
        .respond 200, response

      @EventS.getByTeams(team)
        .then (teamEvents) ->
          # ngResource returns an array of resource instead so we cannot use
          # .to.deep.equal.
          # This should be change if we refactor eventS.getByTeams to parse
          # the events returned.
          for event in teamEvents
            expect(event).to.be.an 'object'
            expect(response).to.include
              id: event.id
              title: event.title

      @HttpBackend.flush()
