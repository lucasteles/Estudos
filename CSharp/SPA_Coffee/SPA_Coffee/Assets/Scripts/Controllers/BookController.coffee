'use strict'
class BookController
	constructor: () ->
	load: (callback) ->
		@__ajax("","GET", (data) ->
			callback(data)
			return
		)
		return

	find: (id, callback) ->
		@__ajax(id,"GET", (data) ->
				callback(data)
				return
		)
		return
					

	edit: (book, callback) ->
		@__ajax(book.id,"PUT", (data) ->
				callback(data)
				return
		,book )
		return


	insert: (book, callback) ->
		@__ajax("","POST", (data) ->
				callback(data)
				return
		,book )
		return

	remove: (id, callback) ->
		@__ajax(id,"DELETE", (data) ->
				callback(data)
				return
		)
		return

# private methods
BookController::__ajax = (action, Type, callback, Data) -> 
	$.ajax({ 
			url: "/api/Books/#{action}"
			dataType: "json"
			type: Type
			contentType : 'application/json'
			data: if Data? then JSON.stringify(Data) else "" 
			success: (data) ->
				callback(data)
				return
			error: (error) ->	
				callback(null, error)
				return
	})
	return;