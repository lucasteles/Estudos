class Pixel3D 
	nX : 0
	nY : 0
	nZ : 0

class Pixel2D 
	nX : 0
	nY : 0

class teles3d
	constructor : (canvas, width, height) ->
		@ctx = canvas.getContext "2d"
		@nVisaoX = 0
		@nVisaoZ = 0   
		@nEscalaX = 1
		@nEscalaY = 1
		@nTamanhoX =width
		@nTamanhoY =height
		@nCentroX =width/2
		@nCentroY=height/2
		@nCamH = 0
		@nCamV = 0
		@nProfun = 1000
		@lineWidth = 2
		@backColor = "black"
		@foreColor = @ctx.fillStyle = "white"

	clear :() =>
		@ctx.clearRect(0, 0, @nTamanhoX, @nTamanhoY)

	AlterCam : (nAngH, nAngV, nDepthX, nDepthY) =>
	    @nCamH    = nAngH
	    @nCamV    = nAngV
	    @nEscalaX = nDepthX
	    @nEscalaY = nDepthY

	AlterColor : (cor) =>
		 @foreColor = @ctx.fillStyle = cor

	AlterVisao : (tnX,tnZ) =>
    	@nVisaoX = tnX
    	@nVisaoZ = tnZ

    Cart2Pixel : (tnP, tcTipo) => 
    	nK=0
	    if tcTipo=='X'
	        nK = (tnP*@nEscalaX)+@nCentroX
	    else
	        nK = (tnP*@nEscalaY)+@nCentroY
	    nK

	_3DTo2D : (toPixel3d) => 
		nTheta = Math.PI * @nCamH / 180.0
		nPhi   = Math. PI * @nCamV / 180.0
		nDepth    = 600

		nCosT = Math.cos(nTheta)
		nSinT  = Math.sin(nTheta)

		nCosP = Math.cos(nPhi)
		nSinP  = Math.sin(nPhi)

		nCosTxCosP  = nCosT * nCosP
		nCosTxSinP = nCosT * nSinP
		nSinTxCosP = nSinT * nCosP
		nSinTxSinP = nSinT * nSinP

		nX0 = toPixel3d.nX
		nY0 = -toPixel3d.nY
		nZ0 = toPixel3d.nZ

		nX1 = nCosT * nX0 + nSinT * nZ0
		nY1 = -nSinTxSinP * nX0 + nCosP * nY0 + nCosTxSinP * nZ0
		nZ1 = (nCosTxCosP * nZ0) - (nSinTxCosP * nX0) - (nSinP * nY0)

		oPix= new Pixel2D()

		oPix.nX = (nX1 * nDepth) / (nZ1+nDepth)
		oPix.nY = (nY1 * nDepth) / (nZ1+nDepth)

		oPix

	DrawLine : (oPixel1, oPixel2) =>
		oPex1 = @_3DTo2D(oPixel1)
		oPex2 = @_3DTo2D(oPixel2)

		nX1 = @Cart2Pixel(oPex1.nX,'X')
		nX2 = @Cart2Pixel(oPex2.nX,'X')
		nY1 = @Cart2Pixel(oPex1.nY,'Y')
		nY2 = @Cart2Pixel(oPex2.nY,'Y')

		nAng=0
		nLin=0
		nX=0
		nY=0
		nMax=0
		nMin=0

		# calculo de angular
		if ((nX2 - nX1)==0)
		    nAng = 0
		else
		    nAng = ((nY2 - nY1) / (nX2 - nX1))

		## calculo linear
		nLin = (nY1-(nAng*nX1))

		nMin = Math.min(nX1, nX2)
		nMax = Math.max(nX1, nX2)

		@ctx.fillStyle = @foreColor
		@ctx.lineWidth=@lineWidth;
		@ctx.beginPath()
		## seta os pontos Y
		for nI in [nMin..nMax]
			nY = Math.round(nAng*nI + nLin)
			@ctx.fillRect(nI,nY,@lineWidth ,@lineWidth )


		nMin = Math.min(nY1, nY2)
		nMax = Math.max(nY1, nY2)

		# seta os pontos X
		for nI in [nMin..nMax]
			if (nAng==0)
				nX = nX1
			else
				nX = Math.round((nI - nLin)/nAng)
			@ctx.fillRect(nX,nI,@lineWidth ,@lineWidth )

		@ctx.closePath()
		@ctx.fill()

	AlterAng : ( tnAng, tnX1, tnZ1, tnX2, tnZ2) =>

		nRad = 6.28318531-tnAng
		nX1 = 0
		nZ1 = 0
		nX2 = 0
		nZ2 = 0

		ret1 =  new Pixel3D()
		ret2 =  new Pixel3D()

		nX1 =tnX1-@nVisaoX
		nX2 =tnX2-@nVisaoX
		nZ1 =tnZ1-@nVisaoZ
		nZ2 =tnZ2-@nVisaoZ

		ret1.nX=(nX1 * Math.cos(nRad)) + (nZ1 * -Math.sin(nRad))
		ret1.nZ=(nX1 * Math.sin(nRad)) + (nZ1 *  Math.cos(nRad))
		ret2.nX=(nX2 * Math.cos(nRad)) + (nZ2 * -Math.sin(nRad))
		ret2.nZ=(nX2 * Math.sin(nRad)) + (nZ2 *  Math.cos(nRad))

		ret1.nX = ret1.nX+@nVisaoX
		ret2.nX = ret2.nX+@nVisaoX
		ret1.nZ = ret1.nZ+@nVisaoZ
		ret2.nZ = ret2.nZ+@nVisaoZ

		[ret1, ret2]

	Line3D : (tnAng, tnX1, tnY1, tnZ1, tnX2, tnY2, tnZ2) =>
	
		oPix1 = new Pixel3D()
		oPix2 = new Pixel3D()

		oPix = @AlterAng(tnAng, tnX1, tnZ1, tnX2, tnZ2)
		
		oPix[0].nY = tnY1
		oPix[1].nY = tnY2

		@DrawLine(oPix[0],oPix[1])

	Point3D : (tnX, tnY, tnZ) =>
	    oPix1 = new Pixel3D()
	    oPix2 = new Pixel3D()

	    oPix1.nX = tnX
	    oPix1.nY = tnY
	    oPix1.nZ = tnZ

	    oPix2.nX = tnX+0.1
	    oPix2.nY = tnY+0.1
	    oPix2.nZ = tnZ+0.1

	    @DrawLine(oPix1,oPix2)

	CircleX3D : ( tnAng, tnX, tnY, tnZ, tnRaio) => 
	    nCX  = tnX
	    nCY  = tnY
	    nTam = tnRaio
	    
	    oPixel= new Pixel3D()
	    oAnt = new Pixel3D()

	    for nI in [0..361]
	        nRad = nI * (Math.PI / 180)

	        oPixel.nX = nCX + (Math.cos(nRad) * nTam)
	        oPixel.nY = nCY + (Math.sin(nRad) * nTam)
	        oPixel.nZ = tnZ

	        if nI > 0
	            @Line3D(tnAng,oAnt.nX,oAnt.nY,oAnt.nZ,oPixel.nX,oPixel.nY,oPixel.nZ)
	        
	        oAnt.nX = oPixel.nX
	        oAnt.nY = oPixel.nY
	        oAnt.nZ = oPixel.nZ

	CircleY3D : ( tnAng, tnX, tnY, tnZ, tnRaio) =>
		nCY  = tnY
		nCZ  = tnZ
		nTam = tnRaio
		oPixel =  new Pixel3D()
		oAnt  = new Pixel3D()

		for nI in [0..361]
			nRad = nI * (Math.PI / 180)

			oPixel.nY =  nCY + (Math.cos(nRad) * nTam)
			oPixel.nZ =  nCZ + (Math.sin(nRad) * nTam)
			oPixel.nX = tnX

			if(nI > 0)
				@Line3D(tnAng,oAnt.nX,oAnt.nY,oAnt.nZ,oPixel.nX,oPixel.nY,oPixel.nZ)

			oAnt.nX = oPixel.nX
			oAnt.nY = oPixel.nY
			oAnt.nZ = oPixel.nZ

	CircleZ3D : ( tnAng, tnX, tnY, tnZ, tnRaio) => 
		nCX  = tnX
		nCZ  = tnZ
		nTam = tnRaio
		oPixel = new Pixel3D()
		oAnt= new Pixel3D()
		for nI in [0..361]
			nRad = nI * (Math.PI / 180)

			oPixel.nX =  nCX + (Math.cos(nRad) * nTam)
			oPixel.nZ =  nCZ + (Math.sin(nRad) * nTam)
			oPixel.nY = tnY

			if(nI > 0)
				@Line3D(tnAng,oAnt.nX,oAnt.nY,oAnt.nZ,oPixel.nX,oPixel.nY,oPixel.nZ)

			oAnt.nX = oPixel.nX
			oAnt.nY = oPixel.nY
			oAnt.nZ = oPixel.nZ

	SquareX3D : ( tnAng, tnX, tnY, tnZ, tnTamX, tnTamY) =>
		nX0 = tnX
		nY0 = tnY
		Z0 = tnZ
		nXT = nX0+tnTamX
		nYT = nY0+tnTamY
		@Line3D(tnAng,nX0,nY0,Z0,nX0,nYT,Z0)
		@Line3D(tnAng,nX0,nY0,Z0,nXT,nY0,Z0)
		@Line3D(tnAng,nX0,nYT,Z0,nXT,nYT,Z0)
		@Line3D(tnAng,nXT,nY0,Z0,nXT,nYT,Z0)

	SquareZ3D : ( tnAng, tnX, tnY, tnZ, tnTamZ, tnTamY) =>
		nX0 = tnX
		nY0 = tnY
		nZ0 = tnZ
		nYT = nY0+tnTamY
		nZT = nZ0+tnTamZ
		@Line3D(tnAng,nX0,nY0,nZ0,nX0,nYT,nZ0)
		@Line3D(tnAng,nX0,nY0,nZ0,nX0,nY0,nZT)
		@Line3D(tnAng,nX0,nYT,nZ0,nX0,nYT,nZT)
		@Line3D(tnAng,nX0,nY0,nZT,nX0,nYT,nZT)


	Cube3D : ( tnAng, tnX, tnY, tnZ, tnTamX, tnTamY, tnTamZ) =>
		nX0 = tnX - tnTamX/2
		nY0 = tnY
		Z0 = tnZ - tnTamZ/2

		@SquareX3D(tnAng,nX0,nY0,Z0,tnTamX,tnTamY)
		@SquareX3D(tnAng,nX0,nY0,Z0+tnTamZ,tnTamX,tnTamY)

		@SquareZ3D(tnAng,nX0,nY0,Z0,tnTamZ,tnTamY)
		@SquareZ3D(tnAng,nX0+tnTamX,nY0,Z0,tnTamZ,tnTamY)

	Plan : ( tnTam, tnLargura) =>
		nX0 = 0 - tnTam
		nY0 = 0
		nZ0 = tnTam
		nI = nX0;
		while ( nI <= tnTam)
			@Line3D(0,nI,nY0,nZ0,nI,nY0,nZ0-(2*tnTam))
			nI += tnLargura

		nI=nZ0
		while ( nI>=-tnTam )
		    @Line3D(0,nX0,nY0,nI,nX0+(2*tnTam),nY0,nI)
		    nI=nI-tnLargura

	Ball : (tnAng,tnX,tnY,tnZ, tnRaio) =>
		@CircleX3D(tnAng,tnX,tnY,tnZ, tnRaio)
		@CircleY3D(tnAng,tnX,tnY,tnZ, tnRaio)
		@CircleZ3D(tnAng,tnX,tnY,tnZ, tnRaio)



