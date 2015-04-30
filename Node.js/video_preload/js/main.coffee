require ["vendor/preloadjs-0.6.0.min"], (preload) ->
	 queue = new createjs.LoadQueue;

	 queue.on(
	 	"complete"
	 	(evt) ->
	 		#videoElement = queue.getResult "video"
	 		#document.body.appendChild videoElement
	 		console.log 'carregou!!'
	 		console.log evt
	 		window.URL.createObjectURL queue.getResult "video"
	 	@
	 )
	 queue.on(
	 	"progress"
	 	(evt) ->
	 		console.log "progress: #{evt.progress}, total: #{evt.total}, loaded: #{evt.loaded}"
	 	@
	 )

	 queue.loadFile 
	 	id: "video"
	 	src: "assets/video/exagerado_p1.mp4"
	 	type: "video"

	 #function handleComplete() {
	 #    createjs.Sound.play("sound");
	 #    var image = queue.getResult("myImage");
	 #    document.body.appendChild(image);
	 #}