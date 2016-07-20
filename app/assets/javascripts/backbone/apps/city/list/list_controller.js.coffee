@RJ.module "CityApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Controller extends App.Controllers.Base

		initialize: ->
			city = App.request "city:entities"

			App.execute "when:fetched", city, =>

				@layout = @getLayoutView city

				@listenTo @layout, "show", =>
					@cityRegion city

				@show @layout


		cityRegion: (city) ->
			cityView = @getCityView city

			@listenTo cityView, "childview:city:member:clicked", (child, args) ->
				App.vent.trigger "city:member:clicked", args.model

			@layout.cityRegion.show cityView

		getCityView: (city) ->
			new List.City
				collection: city

		getLayoutView: (city) ->
			new List.Layout
				collection: city
