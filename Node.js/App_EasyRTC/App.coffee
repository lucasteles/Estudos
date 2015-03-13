teste=""
class App

  @main: (@rtc) ->
    @connect()
    document.getElementById("send").onclick = -> App.send()

  @connect: ->
    @rtc.setPeerListener @addMessage
    @rtc.setRoomOccupantListener @showPeople
    @rtc.connect "test-app", @loginSuccess, @loginFailure

  @loginSuccess: (@easyrtcid) ->
    document.getElementById("meuId").innerHTML = "I am #{@easyrtcid}"

  @loginFailure: (errorCode, message) -> 
    @rtc.showError errorCode, message
    console.log "Erro " + message

  @addMessage: (who, msgType, content ) -> 
      console.log("peeer");
      content = content
                  .replace /&/g,"&amp;" 
                  .replace /</g,"&lt;"
                  .replace />/g,"&gt;"
                  .replace /\n/g, "<br />"
      document.getElementById("conversa").innerHTML +=
        "<b>" + who + ":</b>&nbsp;" + content + "<br />"

  @send:  -> 
      userRtcId = document.getElementById("peaple").value
      text = document.getElementById "message"
      @rtc.sendDataWS(userRtcId, "message",  text.value)
      @addMessage("Me", "message", text.value)
      text.value=""

  @showPeople: (roomName, occupants, isPrimary) =>
      allClients = document.getElementById("peaple");
      allClients.removeChild allClients.lastChild while allClients.hasChildNodes()
      teste  = occupants
      for id of occupants
         option = document.createElement("option")
         option.value = @rtc.idToName id
         option.innerHTML = id
         document.getElementById("peaple").appendChild(option)


window.onload = -> App.main(easyrtc);