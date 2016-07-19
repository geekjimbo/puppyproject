@RJ.module "CityApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

	class Edit.Layout extends App.Views.Layout
		template: "city/edit/edit_layout"

		regions:
			titleRegion:	"#title-region"
			formRegion: 	"#form-region"

	class Edit.Title extends App.Views.ItemView
		template: "city/edit/edit_title"

		modelEvents:
			"updated" : "render"

	class Edit.City extends App.Views.ItemView
		template: "city/edit/edit_city"
		# 
		# onFormSubmit: (data) ->
		# 	console.log "Edit.Crew onFormSubmit", data
		# 	false
