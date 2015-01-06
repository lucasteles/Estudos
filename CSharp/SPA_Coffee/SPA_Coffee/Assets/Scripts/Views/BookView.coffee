'use strict'
require( 
	[	
		"lib/jquery-1.9.0.min"
		"Controllers/BookController" 
		"Models/Book"
	]
	() ->
		controller = new BookController()
		operation = ""
		form = $('form')

		load = () ->
			controller.load( (data) -> 
				grid = $('#main_data tbody')
				grid.empty()
				for book in data
					grid.append(
						"""
						<tr>
							<td class="id">#{book.id}</td>
							<td class="name">#{book.name}</td>
							<td class="author">#{book.author}</td>
							<td class="pages">#{book.pages}</td>
							<td><a href='#' class='edit'>edit</a></td>
							<td><a href='#' class='delete'>excluir</a></td>
						</tr>
						""")
				clear()
				return 
			)
			return 

		clear = () ->
			form.find('#txtId').val('')
			form.find('#txtName').val('')
			form.find('#txtAuthor').val('')
			form.find('#txtPages').val('')
			operation = "insert"
			return

		toBook = () ->
			book = new Book()
			book.id = form.find('#txtId').val()
			book.name = form.find('#txtName').val()
			book.author = form.find('#txtAuthor').val()
			book.pages = form.find('#txtPages').val()
			return book

		insert = () ->
			book = toBook()	
			controller.insert(
				book, 
				(p) -> 
					load()
					return
			)
			return
		
		update = () ->
			book = toBook()
			controller.edit(
				book, 
				(p) -> 
					load()
					return
			)
			return

		deleta = (id) ->
			if id? and id > 0
				controller.remove(
					id, 
					(p) -> 
						load()
						return
				)
			return

		bind = () ->
			form.bind(
				'submit'
				(e) ->
					e.preventDefault()
					switch operation 
						when "insert" then do insert
						when "update" then do update
					return
			)
			$('#btnNovo').bind(
				'click'
				(e) ->
					clear()
					return 
				
			)

			$('#main_data').delegate(
				'.edit'
				'click'
				(e) ->
					clear()
					operation = 'update'
					ele = $(@).parents('tr')

					id = ele.find('.id').text()
					name = ele.find('.name').text()
					author = ele.find('.author').text()
					pages = ele.find('.pages').text()


					form.find('#txtId').val(id)
					form.find('#txtName').val(name)
					form.find('#txtAuthor').val(author)
					form.find('#txtPages').val(pages)
					return
			)
			$('#main_data').delegate(
				'.delete'
				'click'
				(e) ->
					operation = 'delete'
					id =  $(@)
							.parents('tr')
							.find('.id')
							.text()

					deleta(id)
					return
			)
		
			return

		load()
		bind()
		return
)
