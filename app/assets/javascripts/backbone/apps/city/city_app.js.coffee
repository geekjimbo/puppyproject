@RJ.module "CityApp", (CityApp, App, Backbone, Marionette, $, _) ->

	class CityApp.Router extends Marionette.AppRouter
		appRoutes:
			"city"					: "list"

	API =
		list: ->
			new CityApp.List.Controller


	App.vent.on "city:member:clicked", (member) ->
		#console.log member
		#App.vent.trigger "city:list:picked", member.id
		App.request "city:crew", member.id

#		App.navigate Routes.edit_crew_path(member.id)
#		API.edit member.id, member

	App.vent.on "city:cancelled city:updated", (crew) ->
		App.navigate Routes.city_index_path()
		API.list()

	App.addInitializer ->
		new CityApp.Router
			controller: API
