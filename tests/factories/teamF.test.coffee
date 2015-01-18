describe 'Team Factory |', ->
  beforeEach module 'mitt.app'

  beforeEach inject ($injector) ->
    @TeamF = $injector.get 'TeamF'
    @HttpBackend = $injector.get '$httpBackend'
    @ApiPath = $injector.get 'ApiPath'
    @RootScope = $injector.get '$rootScope'

  afterEach ->
    @HttpBackend.verifyNoOutstandingExpectation()
    @HttpBackend.verifyNoOutstandingRequest()

  describe 'getTeams() | ', ->
    RESPONSE = [
      id: 1
      name: 'Dallas Mavericks'
    ,
      id: 2
      name: 'New York Knicks'
    ]

    it 'getTeams() retrieve the list of teams from the server', ->
      @HttpBackend.expect 'GET', "#{@ApiPath}/teams"
        .respond 200, RESPONSE

      @TeamF.getTeams()
        .then (teams) ->
          expect(teams).to.deep.equal RESPONSE

      @HttpBackend.flush()

    it 'getTeams() does not send a request to the server after calling it the first time', ->
      @HttpBackend.expect 'GET', "#{@ApiPath}/teams"
        .respond 200, RESPONSE

      # Calling getTeams() the first time
      @TeamF.getTeams()
      @HttpBackend.flush()

      # Reset the http backend expectations so that it throws an error if
      # a HTTP call is sent out
      @HttpBackend.resetExpectations()

      # Calls getTeams() the second time
      @TeamF.getTeams()
        .then (teams) ->
          expect(teams).to.deep.equal RESPONSE

      # Force $promise to return
      @RootScope.$apply()

  describe 'selectTeam() |', ->
    it 'getSelectedTeam() returns undefined before a team has been selected', ->
      expect(@TeamF.getSelectedTeam()).to.be.undefined

    it 'selectTeam() sets a team and is returned by getSelectTeam()', ->
      team =
        id: 1
        name: 'Dallas Mavericks'
      @TeamF.selectTeam team
      expect(@TeamF.getSelectedTeam()).to.deep.equal team
