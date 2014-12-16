request = require "request"
cheerio = require "cheerio"

request
  uri: "http://www.casasbahia.com.br/Eletronicos/?Filtro=C1"
,(error, response, body) ->
  $ = cheerio.load(body)
  $ '.eletronicos .hproduct'
  .each ->
    text =
       $ this
       .find '.name'
       .text()
    price =
       $ this
       .find '.sale strong'
       .text()

    console.log ">>>", text
    console.log ">>>", price
    return
  return

###

var request = require("request");
var cheerio = require("cheerio");

request({
  uri: "http://www.casasbahia.com.br/Eletronicos/?Filtro=C1",
}, function(error, response, body) {

  var $ = cheerio.load(body);

  $('.eletronicos .hproduct').each(function() {
    var text = $(this).find('.name').text();
    var price = $(this).find('.sale strong').text();

    console.log(">>>", text);
 console.log(">>>", price);
  });
});
###
