@RJ.module "CityApp.New", (New, App, Backbone, Marionette, $, _) ->

	class New.City extends App.Views.ItemView
		template: "city/new/new_city"

		form:
			buttons:
				placement: "left"
