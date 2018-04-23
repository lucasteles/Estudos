
  Pixel3D = (function() {
    class Pixel3D {};

    Pixel3D.prototype.nX = 0;

    Pixel3D.prototype.nY = 0;

    Pixel3D.prototype.nZ = 0;

    return Pixel3D;

  }).call(this);

  Pixel2D = (function() {
    class Pixel2D {};

    Pixel2D.prototype.nX = 0;

    Pixel2D.prototype.nY = 0;

    return Pixel2D;

  }).call(this);

  teles3d = class teles3d {
    constructor(canvas, width, height) {
      this.clear = this.clear.bind(this);
      this.AlterCam = this.AlterCam.bind(this);
      this.AlterColor = this.AlterColor.bind(this);
      this.AlterVisao = this.AlterVisao.bind(this);
      this.Cart2Pixel = this.Cart2Pixel.bind(this);
      this._3DTo2D = this._3DTo2D.bind(this);
      this.DrawLine = this.DrawLine.bind(this);
      this.AlterAng = this.AlterAng.bind(this);
      this.Line3D = this.Line3D.bind(this);
      this.Point3D = this.Point3D.bind(this);
      this.CircleX3D = this.CircleX3D.bind(this);
      this.CircleY3D = this.CircleY3D.bind(this);
      this.CircleZ3D = this.CircleZ3D.bind(this);
      this.SquareX3D = this.SquareX3D.bind(this);
      this.SquareZ3D = this.SquareZ3D.bind(this);
      this.Cube3D = this.Cube3D.bind(this);
      this.Plan = this.Plan.bind(this);
      this.Ball = this.Ball.bind(this);
      this.ctx = canvas.getContext("2d");
      this.nVisaoX = 0;
      this.nVisaoZ = 0;
      this.nEscalaX = 1;
      this.nEscalaY = 1;
      this.nTamanhoX = width;
      this.nTamanhoY = height;
      this.nCentroX = width / 2;
      this.nCentroY = height / 2;
      this.nCamH = 0;
      this.nCamV = 0;
      this.nProfun = 1000;
      this.lineWidth = 2;
      this.backColor = "black";
      this.foreColor = this.ctx.strokeStyle = "white";
    }

    clear() {
      return this.ctx.clearRect(0, 0, this.nTamanhoX, this.nTamanhoY);
    }

    AlterCam(nAngH, nAngV, nDepthX, nDepthY) {
      this.nCamH = nAngH;
      this.nCamV = nAngV;
      this.nEscalaX = nDepthX;
      return this.nEscalaY = nDepthY;
    }

    AlterColor(cor) {
      return this.foreColor = this.ctx.strokeStyle = cor;
    }

    AlterVisao(tnX, tnZ) {
      this.nVisaoX = tnX;
      return this.nVisaoZ = tnZ;
    }

    Cart2Pixel(tnP, tcTipo) {
      var nK;
      nK = 0;
      if (tcTipo === 'X') {
        nK = (tnP * this.nEscalaX) + this.nCentroX;
      } else {
        nK = (tnP * this.nEscalaY) + this.nCentroY;
      }
      return nK;
    }

    _3DTo2D(toPixel3d) {
      var nCosP, nCosT, nCosTxCosP, nCosTxSinP, nDepth, nPhi, nSinP, nSinT, nSinTxCosP, nSinTxSinP, nTheta, nX0, nX1, nY0, nY1, nZ0, nZ1, oPix;
      nTheta = Math.PI * this.nCamH / 180.0;
      nPhi = Math.PI * this.nCamV / 180.0;
      nDepth = 600;
      nCosT = Math.cos(nTheta);
      nSinT = Math.sin(nTheta);
      nCosP = Math.cos(nPhi);
      nSinP = Math.sin(nPhi);
      nCosTxCosP = nCosT * nCosP;
      nCosTxSinP = nCosT * nSinP;
      nSinTxCosP = nSinT * nCosP;
      nSinTxSinP = nSinT * nSinP;
      nX0 = toPixel3d.nX;
      nY0 = -toPixel3d.nY;
      nZ0 = toPixel3d.nZ;
      nX1 = nCosT * nX0 + nSinT * nZ0;
      nY1 = -nSinTxSinP * nX0 + nCosP * nY0 + nCosTxSinP * nZ0;
      nZ1 = (nCosTxCosP * nZ0) - (nSinTxCosP * nX0) - (nSinP * nY0);
      oPix = new Pixel2D();
      oPix.nX = (nX1 * nDepth) / (nZ1 + nDepth);
      oPix.nY = (nY1 * nDepth) / (nZ1 + nDepth);
      return oPix;
    }
 
    DrawLine(oPixel1, oPixel2) {
      var i, j, nAng,  nLin, nMax, nMin, nX, nX1, nX2, nY, nY1, nY2, oPex1, oPex2, ref, ref1, ref2, ref3,f1,f;
      oPex1 = this._3DTo2D(oPixel1);
      oPex2 = this._3DTo2D(oPixel2);
      nX1 = this.Cart2Pixel(oPex1.nX, 'X');
      nX2 = this.Cart2Pixel(oPex2.nX, 'X');
      nY1 = this.Cart2Pixel(oPex1.nY, 'Y');
      nY2 = this.Cart2Pixel(oPex2.nY, 'Y');

      this.ctx.beginPath();
      this.ctx.moveTo(nX1,nY1)
      this.ctx.lineTo(nX2,nY2)
      this.ctx.stroke();
      this.ctx.closePath();
      return;

      nAng = 0;
      nLin = 0;
      nX = 0;
      nY = 0;
      nMax = 0;
      nMin = 0;
      // calculo de angular
      if ((nX2 - nX1) === 0) {
        nAng = 0;
      } else {
        nAng = (nY2 - nY1) / (nX2 - nX1);
      }
      //# calculo linear
      nLin = nY1 - (nAng * nX1);

      nMin = Math.min(nX1, nX2);
      nMax = Math.max(nX1, nX2);
      
      this.ctx.beginPath();
      this.ctx.moveTo(nMin, Math.round(nAng * nMin   + nLin));
      for (let nI=nMin+1; nI<=nMax; nI++) 
      {
       this.ctx.lineTo(nI, Math.round(nAng * nI + nLin));
      }
      
      // nMin = Math.min(nY1, nY1);
      // nMax = Math.max(nY1, nY2);
      // this.ctx.moveTo(Math.round( (nMin - nLin)/nAng), nMin);
      // for (let nI=nMin+1; nI<=nMax; nI++) 
      // {
      //  this.ctx.lineTo(Math.round( (nI - nLin)/nAng), nI);
      // }


      this.ctx.stroke();
      this.ctx.closePath();
    }

    AlterAng(tnAng, tnX1, tnZ1, tnX2, tnZ2) {
      var nRad, nX1, nX2, nZ1, nZ2, ret1, ret2;
      nRad = 6.28318531 - tnAng;
      nX1 = 0;
      nZ1 = 0;
      nX2 = 0;
      nZ2 = 0;
      ret1 = new Pixel3D();
      ret2 = new Pixel3D();
      nX1 = tnX1 - this.nVisaoX;
      nX2 = tnX2 - this.nVisaoX;
      nZ1 = tnZ1 - this.nVisaoZ;
      nZ2 = tnZ2 - this.nVisaoZ;

      ret1.nX = (nX1 * Math.cos(nRad)) + (nZ1 * -Math.sin(nRad));
      ret1.nZ = (nX1 * Math.sin(nRad)) + (nZ1 * Math.cos(nRad));
      ret2.nX = (nX2 * Math.cos(nRad)) + (nZ2 * -Math.sin(nRad));
      ret2.nZ = (nX2 * Math.sin(nRad)) + (nZ2 * Math.cos(nRad));
      ret1.nX = ret1.nX + this.nVisaoX;
      ret2.nX = ret2.nX + this.nVisaoX;
      ret1.nZ = ret1.nZ + this.nVisaoZ;
      ret2.nZ = ret2.nZ + this.nVisaoZ;
      return [ret1, ret2];
    }

    Line3D(tnAng, tnX1, tnY1, tnZ1, tnX2, tnY2, tnZ2) {
      var oPix, oPix1, oPix2;
      oPix1 = new Pixel3D();
      oPix2 = new Pixel3D();
      oPix = this.AlterAng(tnAng, tnX1, tnZ1, tnX2, tnZ2);
      oPix[0].nY = tnY1;
      oPix[1].nY = tnY2;
      return this.DrawLine(oPix[0], oPix[1]);
    }

    Point3D(tnX, tnY, tnZ) {
      var oPix1, oPix2;
      oPix1 = new Pixel3D();
      oPix2 = new Pixel3D();
      oPix1.nX = tnX;
      oPix1.nY = tnY;
      oPix1.nZ = tnZ;
      oPix2.nX = tnX + 0.1;
      oPix2.nY = tnY + 0.1;
      oPix2.nZ = tnZ + 0.1;
      return this.DrawLine(oPix1, oPix2);
    }

    CircleX3D(tnAng, tnX, tnY, tnZ, tnRaio) {
      var i, nCX, nCY, nI, nRad, nTam, oAnt, oPixel, results;
      nCX = tnX;
      nCY = tnY;
      nTam = tnRaio;
      oPixel = new Pixel3D();
      oAnt = new Pixel3D();
      results = [];
      for (nI = i = 0; i <= 361; nI = ++i) {
        nRad = nI * (Math.PI / 180);
        oPixel.nX = nCX + (Math.cos(nRad) * nTam);
        oPixel.nY = nCY + (Math.sin(nRad) * nTam);
        oPixel.nZ = tnZ;
        if (nI > 0) {
          this.Line3D(tnAng, oAnt.nX, oAnt.nY, oAnt.nZ, oPixel.nX, oPixel.nY, oPixel.nZ);
        }
        oAnt.nX = oPixel.nX;
        oAnt.nY = oPixel.nY;
        results.push(oAnt.nZ = oPixel.nZ);
      }
      return results;
    }

    CircleY3D(tnAng, tnX, tnY, tnZ, tnRaio) {
      var i, nCY, nCZ, nI, nRad, nTam, oAnt, oPixel, results;
      nCY = tnY;
      nCZ = tnZ;
      nTam = tnRaio;
      oPixel = new Pixel3D();
      oAnt = new Pixel3D();
      results = [];
      for (nI = i = 0; i <= 361; nI = ++i) {
        nRad = nI * (Math.PI / 180);
        oPixel.nY = nCY + (Math.cos(nRad) * nTam);
        oPixel.nZ = nCZ + (Math.sin(nRad) * nTam);
        oPixel.nX = tnX;
        if (nI > 0) {
          this.Line3D(tnAng, oAnt.nX, oAnt.nY, oAnt.nZ, oPixel.nX, oPixel.nY, oPixel.nZ);
        }
        oAnt.nX = oPixel.nX;
        oAnt.nY = oPixel.nY;
        results.push(oAnt.nZ = oPixel.nZ);
      }
      return results;
    }

    CircleZ3D(tnAng, tnX, tnY, tnZ, tnRaio) {
      var i, nCX, nCZ, nI, nRad, nTam, oAnt, oPixel, results;
      nCX = tnX;
      nCZ = tnZ;
      nTam = tnRaio;
      oPixel = new Pixel3D();
      oAnt = new Pixel3D();
      results = [];
      for (nI = i = 0; i <= 361; nI = ++i) {
        nRad = nI * (Math.PI / 180);
        oPixel.nX = nCX + (Math.cos(nRad) * nTam);
        oPixel.nZ = nCZ + (Math.sin(nRad) * nTam);
        oPixel.nY = tnY;
        if (nI > 0) {
          this.Line3D(tnAng, oAnt.nX, oAnt.nY, oAnt.nZ, oPixel.nX, oPixel.nY, oPixel.nZ);
        }
        oAnt.nX = oPixel.nX;
        oAnt.nY = oPixel.nY;
        results.push(oAnt.nZ = oPixel.nZ);
      }
      return results;
    }

    SquareX3D(tnAng, tnX, tnY, tnZ, tnTamX, tnTamY) {
      var Z0, nX0, nXT, nY0, nYT;
      nX0 = tnX;
      nY0 = tnY;
      Z0 = tnZ;
      nXT = nX0 + tnTamX;
      nYT = nY0 + tnTamY;
      this.Line3D(tnAng, nX0, nY0, Z0, nX0, nYT, Z0);
      this.Line3D(tnAng, nX0, nY0, Z0, nXT, nY0, Z0);
      this.Line3D(tnAng, nX0, nYT, Z0, nXT, nYT, Z0);
      this.Line3D(tnAng, nXT, nY0, Z0, nXT, nYT, Z0);
    }

    SquareZ3D(tnAng, tnX, tnY, tnZ, tnTamZ, tnTamY) {
      var nX0, nY0, nYT, nZ0, nZT;
      nX0 = tnX;
      nY0 = tnY;
      nZ0 = tnZ;
      nYT = nY0 + tnTamY;
      nZT = nZ0 + tnTamZ;
      this.Line3D(tnAng, nX0, nY0, nZ0, nX0, nYT, nZ0);
      this.Line3D(tnAng, nX0, nY0, nZ0, nX0, nY0, nZT);
      this.Line3D(tnAng, nX0, nYT, nZ0, nX0, nYT, nZT);
      this.Line3D(tnAng, nX0, nY0, nZT, nX0, nYT, nZT);
    }

    Cube3D(tnAng, tnX, tnY, tnZ, tnTamX, tnTamY, tnTamZ) {
      var Z0, nX0, nY0;
      nX0 = tnX - tnTamX / 2;
      nY0 = tnY;
      Z0 = tnZ - tnTamZ / 2;
      this.SquareX3D(tnAng, nX0, nY0, Z0, tnTamX, tnTamY);
      this.SquareX3D(tnAng, nX0, nY0, Z0 + tnTamZ, tnTamX, tnTamY);
      this.SquareZ3D(tnAng, nX0, nY0, Z0, tnTamZ, tnTamY);
      return this.SquareZ3D(tnAng, nX0 + tnTamX, nY0, Z0, tnTamZ, tnTamY);
    }

    Plan(tnTam, tnLargura) {
      var nI, nX0, nY0, nZ0, results;
      nX0 = 0 - tnTam;
      nY0 = 0;
      nZ0 = tnTam;
      nI = nX0;
      while (nI <= tnTam) {
        this.Line3D(0, nI, nY0, nZ0, nI, nY0, nZ0 - (2 * tnTam));
        nI += tnLargura;
      }
      nI = nZ0;
      results = [];
      while (nI >= -tnTam) {
        this.Line3D(0, nX0, nY0, nI, nX0 + (2 * tnTam), nY0, nI);
        results.push(nI = nI - tnLargura);
      }
      return results;
    }

    Ball(tnAng, tnX, tnY, tnZ, tnRaio) {
      this.CircleX3D(tnAng, tnX, tnY, tnZ, tnRaio);
      this.CircleY3D(tnAng, tnX, tnY, tnZ, tnRaio);
      return this.CircleZ3D(tnAng, tnX, tnY, tnZ, tnRaio);
    }

  };

