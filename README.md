# **Who's Yo Daddy?** 

This app allows user to randomly select an item from a list and declares it to be "Chosen!".  My first attempt at implementing Angular in a toy app.

Notes to self:

**Client-side** (data **_does not persist_**)

1.  Directive `ng-app` attribute to enable Angular in page.

2.  Data-binding html form input by using `ng-model` to object and an attribute.  One of Angular's big advantages.

3.  Double curlies to view data-binding in action.  Angular updates view in real-time for changes in the form input.

4.  Controller allows for custom behavior with JavaScript.  Create the controller in the `js.coffee` file as a simple function, but include an `ng-controller` directive in a div in the DOM.

5.  Pass in `$scope` into the function call, which will allow us to interact with the view.

6.  Iterate through collection with `ng-repeat` attribute.

7.  Hook into the behavior of a form submission event `ng-submit` attribute to the form tag to trigger a function on the `$scope`, which is added to the `js/coffee` file.  Demonstrates power of Angular's bindings, detecting changes in JS and showing those changes in view.

8.  `ng-click' event on button for choosing an entry at random.

9.  `ng-show="entry.chosen"` is satisfied by the function call for `pickChosen()` on the `ng-click` event.  An entry is chosen at random.

10. `ng-click='remove(entry)'` to delete an entry from the collection, with `indexOf(entry)` and `splice(index,1)` methods in JS.

11. `ng-class='{highlight: entry  == lastChosen}'` is a way to `addClass` in Angular if a condition is satisfied.

12. 'angular.forEach $scope.entries, (entry)' is Angular's own method for iterating through the array.

**Server-side** (making the data **_persist_**)

1.  Generate rails resource `entries` with RESTful routes in controller.

2.  `require angular-resource` in `application.js`, provided in the gem.

3.  Define Angular as a dependency by creating a module.  In the `js.coffee` file, `app = angular.module("Chooser", ['ngResource'])` is the first step to setting up the angular resource dependency.

4.  Modify the `ng-app` to `ng-app='Chooser'` to have the module used in this application.

5.  Add the `$resource` service as argument to the `@ChoiceCtrl` controller.  This is a function that can be called to return an object that allows communication over a REST API.  Written as `Entry = $resource('/entries/:id', {id: '@id'}, {update: {method: 'PUT'}}). From documentation, `$resource(url, [paramDefaults], [actions]);`.

6.  `Entry.query()` will trigger the `#index` action on the Rails application, using the JSON API to return an array of entries.

7.  `Entry.save($scope.newEntry)` will trigger the Rails `#create` action with the added entry as parameter.

8.  `Entry.update(entry)` triggers the `#update` action, but since `entry` is already a `$resource` object, the syntax `entry.$update()` can be used instead.
















