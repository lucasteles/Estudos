public frm as Object
frm= CREATEOBJECT('form')

frm.show

frm.visible= .T.

frm.AddObject('tmrIMG','mytimer')
frm.AddObject('cmdLigar','myButton')

frm.cmdligar.visible= .T.
frm.cmdligar.caption='ligar'


DEFINE CLASS mytimer As timer
   interval=10
   enabled=.F.
   
   PROCEDURE timer
    
    ? 'funciona'
    
ENDDEFINE


DEFINE CLASS mybutton As commandbutton
   height=50
   width=100
   left=200
   top=20
   
   PROCEDURE click
    
    frm.tmrIMG.enabled= .T.
    
ENDDEFINE
