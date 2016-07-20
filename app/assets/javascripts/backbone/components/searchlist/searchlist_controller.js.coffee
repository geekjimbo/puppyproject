@RJ.module "Components.Searchlist", (Searchlist, App, Backbone, Marionette, $, _) ->

	class Searchlist.Controller extends App.Controllers.Base

		initialize: (options = {}) ->
			@contentView = options.view
			@searchlistCollection = options.view.collection

			@searchlistLayout = @getSearchlistLayout options.config
			console.log options.view.collection

			@listenTo @searchlistLayout, "show", @searchlistContentRegion
			#@listenTo @formLayout, "form:submit", @formSubmit
			@listenTo @searchlistLayout, "searchlist:cancel", @searchlistCancel

		searchlistCancel: ->
			@contentView.triggerMethod "searchlist:cancel"

		#formSubmit: ->
		#	data = Backbone.Syphon.serialize @formLayout
		#	if @contentView.triggerMethod("form:submit", data) isnt false
		#		model = @contentView.model
		#		collection = @contentView.collection
		#		@processFormSubmit data, model, collection

		#processFormSubmit: (data, model, collection) ->
		#	model.save data,
		#		collection: collection

		onClose: ->
			console.log "onClose", @

			searchlistContentRegion: ->
			@region = @searchlistLayout.searchlistContentRegion
			@show @contentView

		getSearchlistLayout: (options = {}) ->
			config = @getDefaultConfig _.result(@contentView, "searchlist")
			_.extend config, options

			#buttons = @getButtons config.buttons

			new Searchlist.FormWrapper
				config: config
				collection: @searchlistCollection  #@contentView.Collection
				#buttons: buttons

		getDefaultConfig: (config = {}) ->
			_.defaults config,
				footer: true
				focusFirstInput: true
				errors: true
				syncing: true

		#getButtons: (buttons = {}) ->
		#	App.request("searchlist:button:entities", buttons, @contentView.collection) unless buttons is false

	App.reqres.setHandler "searchlist:wrapper", (contentView, options = {}) ->
		throw new Error "No model found inside of search list's contentView" unless contentView.collection
		searchlistController = new Searchlist.Controller
			view: contentView
			config: options
		searchlistController.searchlistLayout
