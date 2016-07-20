@RJ.module "Components.Searchlist", (Searchlist, App, Backbone, Marionette, $, _) ->

	class Searchlist.FormWrapper extends App.Views.Layout
		template: "searchlist/form"

		tagName: "form"


		regions:
			searchlistContentRegion: "#searchlist-content-region"


		initialize: ->
			@setInstancePropertiesFor "config"  #, "buttons"

		serializeData: ->
			collection: @collection
			#footer: @config.footer
			#buttons: @buttons?.toJSON() ? false

		onShow: ->
			_.defer =>
				@focusFirstInput() if @config.focusFirstInput
				#@buttonPlacement() if @buttons

		#buttonPlacement: ->
		#	@ui.buttonContainer.addClass @buttons.placement

		focusFirstInput: ->
			@$(":input:visible:enabled:first").focus()

		#getFormDataType: ->
		#	if @model.isNew() then "new" else "edit"

		#changeErrors: (model, errors, options) ->
		#	if @config.errors
		#		if _.isEmpty(errors) then @removeErrors() else @addErrors errors

		#removeErrors: ->
		#	@$(".error").removeClass("error").find("small").remove()

		#addErrors: (errors = {}) ->
		#	for name, array of errors
		#		@addError name, array[0]

		#addError: (name, error) ->
		#	el = @$("[name='#{name}']")
		#	sm = $("<small>").text(error)
		#	el.after(sm).closest(".row").addClass("error")

		#syncStart: (model) ->
		#	@addOpacityWrapper() if @config.syncing

		#syncStop: (model) ->
		#	@addOpacityWrapper(false) if @config.syncing
