@RJ.module "Components.Popuplist", (Popuplist, App, Backbone, Marionette, $, _) ->

	class Popuplist.Controller extends App.Controllers.Base

		initialize: (options = {}) ->
			#@contentView = options.view
			#@popuplist = options.view.collection
			popuplist = App.request "city:entities"
			console.log popuplist

			App.execute "when:fetched", popuplist, =>

				console.log "Pre @getPoplistLayout"
				@layout = @getPopuplistLayout popuplist

				@listenTo @layout, "show", =>
					@popuplistRegion popuplist

				@show @layout

		onClose: ->
			#console.log "onClose", @

		getPopuplistLayout: (popuplist) ->
			new Popuplist.Layout
				collection: popuplist

		popuplistRegion: (popuplist) ->
			popuplistView = @getPopuplistView popuplist

			#@listenTo popuplistView, "popuplist:cancel", ->
			#	App.vent.trigger "popuplist:cancelled", collection

			#@listenTo popuplistView, "childview:popuplist:member:clicked", (child, args) ->
			#	App.vent.trigger "popuplist:member:clicked", args.model

			@layout.popuplistRegion.show popuplistView

		getPopuplistView: (popuplist) ->
			new Popuplist.Popuplist
				collection: popuplist


	App.reqres.setHandler "popuplist:wrapper", (contentView, options = {}) ->
		throw new Error "No model found inside of search list's contentView" unless contentView.collection
		popuplistController = new Popuplist.Controller
			view: contentView
			config: options
		popuplistController.layout
