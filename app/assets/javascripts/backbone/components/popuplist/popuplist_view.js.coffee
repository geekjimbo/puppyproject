@RJ.module "Components.Popuplist", (Popuplist, App, Backbone, Marionette, $, _) ->

	class Popuplist.Layout extends App.Views.Layout
		template: "popuplist/_layout"

		regions:
			popuplistRegion: "#popuplist-region"


	class Popuplist.PopuplistMember extends App.Views.ItemView
		template: "popuplist/_popuplist_member"
		tagName: "option"
		className:  "popuplist-member"

		triggers:
			"click" 										: "pouplist:member:clicked"

	class Popuplist.Empty extends App.Views.ItemView
		template: "popuplist/_empty"
		tagName: "option"

	class Popuplist.Popuplist extends App.Views.CompositeView
		template: "popuplist/_popuplist"
		itemView: Popuplist.PopuplistMember
		emptyView: Popuplist.Empty
		itemViewContainer: "select"
