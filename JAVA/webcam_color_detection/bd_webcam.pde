// - Super Fast Blur v1.1 by Mario Klingemann <http://incubator.quasimondo.com>
// - BlobDetection library

import processing.video.*;
import blobDetection.*;
int nW,nH;
Capture cam;
BlobDetection theBlobDetection;
PImage img;
boolean newFrame=false;

// ==================================================
// setup()
// ==================================================
void setup()
{       
        nW = 800;
        nH = 600;
	// Size of applet
	size(nW, nH);
	// Capture
	cam = new Capture(this, nW, nH,15);
	// BlobDetection
	// img which will be sent to detection (a smaller copy of the cam frame);
	img = new PImage(nW,nH); 
	theBlobDetection = new BlobDetection(img.width, img.height);
	theBlobDetection.setPosDiscrimination(true);
	theBlobDetection.setThreshold(0.1f); // will detect bright areas whose luminosity > 0.2f;
}

// ==================================================
// captureEvent()
// ==================================================
void captureEvent(Capture cam)
{
	cam.read();
	newFrame = true;
}

// ==================================================
// draw()
// ==================================================
void draw()
{
	if (newFrame)
	{
		newFrame=false;
                
		image(cam,0,0,width,height);
		img.copy(cam, 0, 0, cam.width, cam.height, 
				0, 0, img.width, img.height);
		img = Transform(img);
		theBlobDetection.computeBlobs(img.pixels);
		drawBlobsAndEdges(true,true);
	}
}

// ==================================================
// drawBlobsAndEdges()
// ==================================================
void drawBlobsAndEdges(boolean drawBlobs, boolean drawEdges)
{
	noFill();
	Blob b;
	EdgeVertex eA,eB;
	for (int n=0 ; n<theBlobDetection.getBlobNb() ; n++)
	{
		b=theBlobDetection.getBlob(n);
		if (b!=null)
		{
			// Edges
			if (drawEdges)
			{
				strokeWeight(3);
				stroke(0,255,0);
				for (int m=0;m<b.getEdgeNb();m++)
				{
					eA = b.getEdgeVertexA(m);
					eB = b.getEdgeVertexB(m);
                                        int xa = (int)eA.x*width;
                                        int ya = (int)eA.y*height;
                                        int xb = (int)eA.x*width;
                                        int yb = (int)eA.y*height;
					if (eA !=null && eB !=null)
                                                  line(
							eA.x*width, eA.y*height, 
							eB.x*width, eB.y*height
							);
				}
			}

			// Blobs
			if (drawBlobs)
			{
				strokeWeight(1);
				stroke(255,0,0);
				rect(
					b.xMin*width,b.yMin*height,
					b.w*width,b.h*height
					);
			}

		}

      }
}

PImage Transform(PImage oImg){
  int nRed,nMinRed,nMaxRed;
  int nGreen,nMinGreen,nMaxGreen;
  int nBlue,nMinBlue,nMaxBlue;
  color oCor = color(0,0,0);
  nMinRed   = 40;
  nMaxRed   = 255;
  nMinGreen = 0;
  nMaxGreen = 10;
  nMinBlue  = 0;
  nMaxBlue  = 20;
  
  for(int i=0;i<=width;i++){
    for(int j=0;j<=height;j++){
      oCor   = get(i,j);
      nRed   = (int)red(oCor);
      nGreen = (int)green(oCor);
      nBlue  = (int)blue(oCor);
      
      if(!(nRed>=nMinRed && nRed<=nMaxRed && nGreen>=nMinGreen && nGreen<=nMaxGreen && nBlue>=nMinBlue && nBlue<=nMaxBlue)){
          oImg.set(i,j,color(0,0,0));
          //set(i,j,color(0,0,0));
      }
      else{
          oImg.set(i,j,color(255,255,255));
          //set(i,j,color(255,255,255));
      }
    }
  }
  return(oImg);
}
