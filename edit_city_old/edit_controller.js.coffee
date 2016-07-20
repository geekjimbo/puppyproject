@RJ.module "CityApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

	class Edit.Controller extends App.Controllers.Base

		initialize: (options) ->
			{ city, id } = options
			city or= App.request "city:entity", id

			@listenTo city, "updated", ->
				App.vent.trigger "city:updated", city

			App.execute "when:fetched", city, =>
				@layout = @getLayoutView city

				@listenTo @layout, "show", =>
					@titleRegion city
					@formRegion city

				@show @layout

		titleRegion: (city) ->
			titleView = @getTitleView city
			@layout.titleRegion.show titleView

		formRegion: (city) ->
			editView = @getEditView city

			@listenTo editView, "form:cancel", ->
				App.vent.trigger "city:cancelled", city

			formView = App.request "form:wrapper", editView

			@layout.formRegion.show formView

		getTitleView: (city) ->
			new Edit.Title
				model: city
		
		getLayoutView: (city) ->
			new Edit.Layout
				model: city

		getEditView: (city) ->
			new Edit.City
				model: city
