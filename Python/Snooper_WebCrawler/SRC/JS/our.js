function ShowLoad(oid,lWait){

    if (lWait)
        $(oid).delay(1000);

    $(oid).hide().fadeIn('slow');

}

function HideLoad(oid){
        $(oid).delay(1000);
        $(oid).fadeOut('slow');
    }




function YoxView(oid){

    $(".thumbnails").yoxview({
    });
}



//Função que será executada quando o usuário enviar o formulário.
function enviarDados(saida, limpar) 
{
   
    //Cria um novo objeto XMLHTTPRequest e o armazena na variável objeto_xhr
    var objeto_xhr;
    var cOpt = $('input[@name="optionsRadios"]:checked').val();
    var Site = document.getElementById("appendedInputButton").value;

    if (!Site && limpar)
    {
        saida.innerHTML = '<h4><font color=green>Enter a URL to search :)</font></h4>';
        return false;
    }


    if (window.XMLHttpRequest) { // Mozilla, Safari, ...
        objeto_xhr = new XMLHttpRequest();
    } else if (window.ActiveXObject) { // IE
        objeto_xhr = new ActiveXObject("Microsoft.XMLHTTP");
    }    
    	
    


    //Armazena uma função que será chamada sempre que a propriedade "readyState" do objeto "objeto_xhr" tiver o seu valor modificado.
    objeto_xhr.onreadystatechange = function() {
    	//Se não ocorrer nenhum erro na solicitação, mostra a resposta do servidor dentro do elemento HTML "DIV"
        if(objeto_xhr.readyState == 4 && objeto_xhr.status == 200) {
           HideLoad("#Loader");
           ShowLoad("#More",false);
      
           var cID = "Ajax"+Math.round(Math.random()*10000).toString();
           var cAux = '<br /><div id='+cID+'>';
           
           if (limpar && (cOpt=='lnk' || cOpt=='files'))
                cAux = cAux + '<table class="table table-hover"><thead><tr><th style="min-width:50px;">#</th><th width=100>Name</th><th width=300>Link</th></tr></thead>';
            
           if (!limpar && (cOpt=='lnk' || cOpt=='files'))
                cAux = cAux + '<table class="table table-hover"><thead><tr><th style="min-width:50px;"></th><th width=100></th><th width=300></th></tr></thead>';


           if (limpar)
           {
                saida.innerHTML = cAux + objeto_xhr.responseText + "</div>"
            }
           else
           {
                saida.innerHTML = saida.innerHTML + cAux + objeto_xhr.responseText;

                if (cOpt=='lnk' || cOpt=='files')
                   saida.innerHTML = saida.innerHTML + "</table>";

                saida.innerHTML = saida.innerHTML + "</div>";

            }



           ShowLoad("#"+cID,false);

           if (cOpt=='img')
                YoxView();

            //$('html, body').animate({ scrollTop: saida.scrollHeight*10 }, 'slow'); 

        }
        //Mensagem que será mostrada se a página solicitada não for encontrada
        else if(objeto_xhr.status == 404) {
            saida.innerHTML = "A página solicitada não existe.";
        }
        //Mensagem que será mostrada enquanto a solicitação está sendo processada
        else if(objeto_xhr.readyState == 1 || objeto_xhr.readyState == 2 || objeto_xhr.readyState == 3) {
            //saida.innerHTML = "carregando";
            //ShowLoad();
        }
           
        
    }

     if (limpar)
        saida.innerHTML = '';

    var useCache = '';
    if (!limpar)
        useCache = 'CACHE';
    
    var parameters="txtSite="+Site+"&txtTipo="+cOpt+"&txtCache="+useCache;
    
    objeto_xhr.open("POST", "get_LoadLinks", true);
    objeto_xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    objeto_xhr.send(parameters); //Envia os dados para o servidor

    //objeto_xhr.open("GET", "get_LoadLinks?txtSite=" + Site + "&txtTipo="+cOpt, true);
    //objeto_xhr.send(); //Envia os dados para o servidor

    HideLoad("#More");
    ShowLoad("#Loader",true);


    }