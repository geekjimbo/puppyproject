@RJ.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

	class Entities.City extends App.Entities.Model
		urlRoot: -> Routes.city_index_path()

	class Entities.CityCollection extends App.Entities.Collection
		model: Entities.City

		url: -> Routes.city_index_path()

	API =
		getCrew: ->
			city = new Entities.CityCollection
			crew.fetch
				reset: true
			crew

		getCityMember: (id) ->
			member = new Entities.City
				id: id
			member.fetch()
			member

		newCityMember: ->
			new Entities.City

	App.reqres.setHandler "city:entities", ->
		API.getCity()

	App.reqres.setHandler "city:entity", (id) ->
		API.getCityMember id

	App.reqres.setHandler "new:city:entity", ->
		API.newCityMember()
