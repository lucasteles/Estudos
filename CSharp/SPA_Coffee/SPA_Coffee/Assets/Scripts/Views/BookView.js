'use strict';
require(["lib/jquery-1.9.0.min", "Controllers/BookController", "Models/Book"], function() {
  var bind, clear, controller, deleta, form, insert, load, operation, toBook, update;
  controller = new BookController();
  operation = "";
  form = $('form');
  load = function() {
    controller.load(function(data) {
      var book, grid, _i, _len;
      grid = $('#main_data tbody');
      grid.empty();
      for (_i = 0, _len = data.length; _i < _len; _i++) {
        book = data[_i];
        grid.append("<tr>\n	<td class=\"id\">" + book.id + "</td>\n	<td class=\"name\">" + book.name + "</td>\n	<td class=\"author\">" + book.author + "</td>\n	<td class=\"pages\">" + book.pages + "</td>\n	<td><a href='#' class='edit'>edit</a></td>\n	<td><a href='#' class='delete'>excluir</a></td>\n</tr>");
      }
      clear();
    });
  };
  clear = function() {
    form.find('#txtId').val('');
    form.find('#txtName').val('');
    form.find('#txtAuthor').val('');
    form.find('#txtPages').val('');
    operation = "insert";
  };
  toBook = function() {
    var book;
    book = new Book();
    book.id = form.find('#txtId').val();
    book.name = form.find('#txtName').val();
    book.author = form.find('#txtAuthor').val();
    book.pages = form.find('#txtPages').val();
    return book;
  };
  insert = function() {
    var book;
    book = toBook();
    controller.insert(book, function(p) {
      load();
    });
  };
  update = function() {
    var book;
    book = toBook();
    controller.edit(book, function(p) {
      load();
    });
  };
  deleta = function(id) {
    if ((id != null) && id > 0) {
      controller.remove(id, function(p) {
        load();
      });
    }
  };
  bind = function() {
    form.bind('submit', function(e) {
      e.preventDefault();
      switch (operation) {
        case "insert":
          insert();
          break;
        case "update":
          update();
      }
    });
    $('#btnNovo').bind('click', function(e) {
      clear();
    });
    $('#main_data').delegate('.edit', 'click', function(e) {
      var author, ele, id, name, pages;
      operation = 'update';
      clear();
      ele = $(this).parents('tr');
      id = ele.find('.id').text();
      name = ele.find('.name').text();
      author = ele.find('.author').text();
      pages = ele.find('.pages').text();
      form.find('#txtId').val(id);
      form.find('#txtName').val(name);
      form.find('#txtAuthor').val(author);
      form.find('#txtPages').val(pages);
    });
    $('#main_data').delegate('.delete', 'click', function(e) {
      var id;
      operation = 'delete';
      id = $(this).parents('tr').find('.id').text();
      deleta(id);
    });
  };
  load();
  bind();
});
