@RJ.module "CityApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Controller extends App.Controllers.Base

		initialize: ->
			city = App.request "city:entities"

			App.execute "when:fetched", city, =>

				@layout = @getLayoutView city

				# @listenTo @layout, "close", @close

				@listenTo @layout, "show", =>
					@titleRegion()
					@panelRegion()
					@cityRegion city

				@show @layout

		titleRegion: ->
			titleView = @getTitleView()
			@layout.titleRegion.show titleView

		panelRegion: ->
			panelView = @getPanelView()

			@listenTo panelView, "new:city:button:clicked", =>
				@newRegion()

			@layout.panelRegion.show panelView

		newRegion: ->
      App.execute "new:city:member", @layout.newRegion

		cityRegion: (city) ->
			cityView = @getCityView city

			@listenTo cityView, "childview:city:member:clicked", (child, args) ->
				App.vent.trigger "city:member:clicked", args.model

			@listenTo cityView, "childview:city:delete:clicked", (child, args) ->
				model = args.model
				if confirm "Are you sure you want to delete #{model.get("name")}?" then model.destroy() else false

			@layout.cityRegion.show cityView

		getCityView: (city) ->
			new List.City
				collection: city

		getPanelView: ->
			new List.Panel

		getTitleView: ->
			new List.Title

		getLayoutView: (city) ->
			new List.Layout
				collection: city
