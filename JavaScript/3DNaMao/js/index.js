var c = document.getElementById("c");
var WIDTH = c.width = window.innerWidth;
var HEIGHT = c.height = window.innerHeight;

var CanH = 0;
var CanV = -30;
var Scale = 1;
desenho =  new teles3d(c,WIDTH, HEIGHT);
desenho.AlterCam(CanH,CanV,Scale,Scale);

var angle = 0;
var angle2 = 0;


function draw()
{
  desenho.clear();
  
  // desenha o plano
  desenho.AlterColor("white");
  desenho.Plan(100,20);
  
  //desenha cubo
  desenho.AlterColor("red");  
  desenho.AlterVisao(-100, 0); //define o centro de rotação 
  desenho.Cube3D(angle, -100, 20, 0, 40, 40, 40);
  
   //desenha bola
  desenho.AlterColor("blue");  
  desenho.AlterVisao(100, 0); 
  desenho.Ball(angle2, 100, 30, 0, 20);
 
   desenho.AlterColor("green");  
  desenho.AlterVisao(0, 0); 
  desenho.SquareX3D(angle2, -30, 20, 0, 20,30);
  
   desenho.AlterColor("yellow");  
  desenho.AlterVisao(0, 100); 
  desenho.CircleY3D(angle, 0, 30, 100, 20,30);
  
  
  angle+=0.01;
  if (angle==Math.PI*2)
    angle=0;
  
  angle2+=0.1;
  if (angle2==Math.PI*2)
    angle2=0;
  
  window.requestAnimationFrame(draw);
}

window.requestAnimationFrame(draw);


document.onkeydown = function (e) {

    e = e || window.event;

    if (e.keyCode == '38') {
       CanV=CanV+10;
    }
    else if (e.keyCode == '40') {
        CanV=CanV-10;
    }
    else if (e.keyCode == '37') {
       CanH=CanH+10;
    }
    else if (e.keyCode == '39') {
        CanH=CanH-10;
    }
  
  else if (e.keyCode == '187') {
        Scale=Scale+1;
    }
  
  else if (e.keyCode == '189') {
        Scale=Scale-1;
    }
   
    desenho.AlterCam(CanH,CanV,Scale,Scale);

}