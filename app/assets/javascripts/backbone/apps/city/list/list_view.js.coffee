@RJ.module "CityApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Layout extends App.Views.Layout
		template: "city/list/list_layout"

		regions:
			#titleRegion: 	"#title-region"
			#panelRegion:	"#panel-region"
			#newRegion:		"#new-region"
			#cityRegion:		"#city-region"
			cityRegion: 	"#form-region"

	#class List.Title extends App.Views.ItemView
		#template: "city/list/_title"

	#class List.Panel extends App.Views.ItemView
		#template: "city/list/_panel"

		#triggers:
			#"click #new-city" : "new:city:button:clicked"

	class List.CityMember extends App.Views.ItemView
		template: "city/list/_city_member"
		tagName: "li"
		className: "city-member"

		triggers:
			"click .city-delete button" : "city:delete:clicked"
			"click" 										: "city:member:clicked"

	class List.Empty extends App.Views.ItemView
		template: "city/list/_empty"
		tagName: "li"

	class List.City extends App.Views.CompositeView
		template: "city/list/_city"
		itemView: List.CityMember
		emptyView: List.Empty
		itemViewContainer: "ul"
