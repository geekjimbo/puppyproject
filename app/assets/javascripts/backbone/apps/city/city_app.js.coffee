@RJ.module "CityApp", (CityApp, App, Backbone, Marionette, $, _) ->

	class CityApp.Router extends Marionette.AppRouter
		appRoutes:
			"city/:id/edit"	: "edit"
			"city"					: "list"

	API =
		list: ->
			new CityApp.List.Controller

		newCity: (region) ->
			new CityApp.New.Controller
				region: region

		edit: (id, member) ->
			new CityApp.Edit.Controller
				id: id
				crew: member

	App.commands.setHandler "new:city:member", (region) ->
		API.newCity region

	App.vent.on "city:member:clicked city:created", (member) ->
		App.navigate Routes.edit_city_path(member.id)
		API.edit member.id, member

	App.vent.on "city:cancelled city:updated", (crew) ->
		App.navigate Routes.city_index_path()
		API.list()

	App.addInitializer ->
		new CityApp.Router
			controller: API
