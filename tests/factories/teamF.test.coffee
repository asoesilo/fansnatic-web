describe 'Team Factory |', ->
  beforeEach module 'mitt.app'

  beforeEach inject ($injector) ->
    @TeamF = $injector.get 'TeamF'
    @HttpBackend = $injector.get '$httpBackend'
    @ApiPath = $injector.get 'ApiPath'

  afterEach ->
    @HttpBackend.verifyNoOutstandingExpectation()
    @HttpBackend.verifyNoOutstandingRequest()

  describe 'initialize() | ', ->
    it 'getTeams() return undefined before initialize() is called', ->
      expect(@TeamF.getTeams()).to.be.undefined

    it 'initialize() retrieve the list of teams from the server', ->
      response = [
        id: 1
        name: 'Dallas Mavericks'
      ,
        id: 2
        name: 'New York Knicks'
      ]
      @HttpBackend.expect 'GET', "#{@ApiPath}/teams"
        .respond 200, response

      @TeamF.initialize()
        .then ->
          expect(@TeamF.getTeams()).to.deep.equal response
      @HttpBackend.flush()

  describe 'selectTeam() |', ->
    it 'getSelectedTeam() returns undefined before a team has been selected', ->
      expect(@TeamF.getSelectedTeam()).to.be.undefined

    it 'selectTeam() sets a team and is returned by getSelectTeam()', ->
      team =
        id: 1
        name: 'Dallas Mavericks'
      @TeamF.selectTeam team
      expect(@TeamF.getSelectedTeam()).to.deep.equal team
