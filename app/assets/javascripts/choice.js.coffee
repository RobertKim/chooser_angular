app = angular.module("Chooser", ['ngResource'])

app.factory 'Entry', ($resource) ->
	$resource('/entries/:id', {id: '@id'}, {update: {method: 'PUT'}})

@ChoiceCtrl = ($scope, Entry) ->
	$scope.entries = Entry.query()

	$scope.pickChosen = ->
		pool = []
		angular.forEach $scope.entries, (entry) ->
			pool.push(entry) if !entry.chosen
		if pool.length > 0
			entry = pool[Math.floor(Math.random()*pool.length)]
			entry.chosen = true
			entry.$update()
			$scope.lastChosen = entry

	$scope.addEntry = ->
		entry = Entry.save($scope.newEntry)
		$scope.entries.push(entry)
		$scope.newEntry = {}

	$scope.remove = (entry) ->
		index = $scope.entries.indexOf(entry)
		$scope.entries.splice(index,1)

