/*! FightCode - v0.2.0
 * http://fightcodega.me/
 */
var IconPainter;
IconPainter = {colorDistance: function (e, t)
{
    var n, r, i, s, o, u, a, f, l, c, h, p;
    return l = this.XYZToLab(this.RGBToXYZ(e)), c = this.XYZToLab(this.RGBToXYZ(t)), n = Math.sqrt(l[1] * l[1] + l[2] * l[2]), r = Math.sqrt(c[1] * c[1] + c[2] * c[2]), o = n - r, a = l[0] - c[0], i = l[1] - c[1], s = l[2] - c[2], u = Math.sqrt(i * i + s * s - o * o), f = a, h = o / (1 + .045 * n), p = u / (1 + .015 * n), Math.sqrt(f * f + h * h + p * p)
}, RGBToXYZ: function (e)
{
    var t, n, r, i, s, o;
    r = [e.r / 255, e.g / 255, e.b / 255], n = 0;
    while (n < 3)t = r[n], t > .04045 ? (t = (t + .055) / 1.055, t = Math.pow(t, 2.4)) : t /= 12.92, r[n] = t * 100, ++n;
    return i = r[0] * .4124 + r[1] * .3576 + r[2] * .1805, s = r[0] * .2126 + r[1] * .7152 + r[2] * .0722, o = r[0] * .0193 + r[1] * .1192 + r[2] * .9505, [i, s, o]
}, XYZToLab: function (e)
{
    var t, n, r, i, s, o;
    o = [e[0] / 95.047, e[1] / 100, e[2] / 108.883], i = 0;
    while (i < 3)r = o[i], r > .008856 ? r = Math.pow(r, 1 / 3) : r = 7.787 * r + 16 / 116, o[i] = r, ++i;
    return s = 116 * o[1] - 16, t = 500 * (o[0] - o[1]), n = 200 * (o[1] - o[2]), [s, t, n]
}, HexToRGB: function (e)
{
    return e = e.indexOf("#") > -1 ? e.substring(1) : e, e.length === 3 && (e = e.split("").reduce(function (e, t)
    {
        return e + t + t
    }, "")), e = parseInt(e, 16), {r: e >> 16, g: (e & 65280) >> 8, b: e & 255, a: 1}
}, RGBAStrToRGB: function (e)
{
    var t, n;
    return t = e.replace(/rgba\s*\(([\d\s,.]*)\)/i, "$1").split(","), n = {r: parseInt($.trim(t[0]), 10), g: parseInt($.trim(t[1]), 10), b: parseInt($.trim(t[2]), 10), a: parseFloat($.trim(t[3]))}, n
}, StrToRGB: function (e)
{
    return e.indexOf("#") >= 0 ? this.HexToRGB(e) : this.RGBAStrToRGB(e)
}, onImageReady: function (e, t, n, r, i)
{
    var s, o, u, a, f, l, c, h, p, d, v, m, g;
    h = e.width, u = e.height, s = $("<canvas width='" + h + "' height='" + u + "'>")[0].getContext("2d"), s.globalCompositeOperation = "copy", s.drawImage(e, 0, 0), a = s.getImageData(0, 0, h, u), l = a.data;
    for (d = v = 0; 0 <= u ? v <= u : v >= u; d = 0 <= u ? ++v : --v)for (p = m = 0, g = h * 4; m <= g; p = m += 4)c = d * h * 4 + p, o = this.colorDistance(n, {r: l[c + 0], g: l[c + 1], b: l[c + 2]}), o < r && (f = .3 * l[c + 0] + .59 * l[c + 1] + .11 * l[c + 2], l[c + 0] = t.r * (f / 127), l[c + 1] = t.g * (f / 127), l[c + 2] = t.b * (f / 127), l[c + 3] = t.a * l[c + 3]);
    return s.putImageData(a, 0, 0), i(s.canvas.toDataURL())
}, paintIcon: function (e, t, n, r, i)
{
    var s, o = this;
    return r == null && (r = 27), typeof t == "string" && (t = this.StrToRGB(t)), typeof e == "string" ? (s = document.createElement("img"), s.onload = function ()
    {
        return o.onImageReady(s, t, n, r, i)
    }, s.src = e) : this.onImageReady(e, t, n, r, i)
}};
var Game, __bind = function (e, t)
{
    return function ()
    {
        return e.apply(t, arguments)
    }
};
(function ()
{
    var e, t, n, r, i, s;
    n = window, s = ["ms", "moz", "webkit", "o"];
    for (r = 0, i = s.length; r < i; r++)
    {
        t = s[r];
        if (n.requestAnimationFrame)break;
        n.requestAnimationFrame = n["" + t + "RequestAnimationFrame"], n.cancelAnimationFrame = n["" + t + "CancelAnimationFrame"] || n["" + t + "CancelRequestAnimationFrame"]
    }
    return e = 0, n.requestAnimationFrame || (n.requestAnimationFrame = function (t)
    {
        var r;
        return e = Math.max(e + 16, r = +(new Date)), n.setTimeout(function ()
        {
            return t(+(new Date))
        }, e - r)
    }), n.cancelAnimationFrame || (n.cancelAnimationFrame = function (e)
    {
        return clearTimeout(e)
    })
})(), Game = function ()
{
    function e(e, t, n)
    {
        this.board = e, this.result = t, this.options = n, this.play = __bind(this.play, this), this.result ? (this.events = t.result, this.gameEnded = !0) : this.events = [], this.currentRound = 0, this.lastRound = null, this.objects = {}, this.options = $.extend({msPerRound: 100}, this.options)
    }

    return e.prototype.start = function ()
    {
        return this.lastRound = null, requestAnimationFrame(this.play)
    }, e.prototype.end = function ()
    {
        return this.gameEnded = !0
    }, e.prototype.forceEnd = function ()
    {
        return this.end(), this.events = []
    }, e.prototype.addRound = function (e)
    {
        return this.events.push(e)
    }, e.prototype.createTank = function (e)
    {
        var t, n, r, i, s;
        return i = $('<div class="tank"><div class="body"></div><div class="cannon"></div><div class="life"></div><div class="explosion"></div></div>'), s = {id: e.id, name: e.name, color: e.color, tank: i, body: i.find(".body"), cannon: i.find(".cannon"), life: i.find(".life")}, r = {r: 76, g: 168, b: 27}, n = {r: 108, g: 211, b: 42}, t = s.color || "#ff0000", IconPainter.paintIcon("fightcode/img/tanks.png", t, r, 27, function (e)
        {
            return s.body.css("background-image", "url(" + e + ")")
        }), IconPainter.paintIcon("fightcode/img/cannon.png", t, n, 60, function (e)
        {
            return s.cannon.css("background-image", "url(" + e + ")")
        }), this.board.append(i), this.objects[e.id] = s, s
    }, e.prototype.createBullet = function (e)
    {
        var t, n;
        return t = $('<div class="bullet"><div class="explosion"></div></div>'), this.board.append(t), n = {id: e.id, bullet: t, width: t.width(), height: t.height()}, this.objects[e.id] = n, n
    }, e.prototype.applyRotate = function (e, t)
    {
        return e.style.webkitTransform = e.style.mozTransform = e.style.transform = "rotate3d(0,0,1," + t + "deg)"
    }, e.prototype.handleTank = function (e)
    {
        var t;
        return t = this.objects[e.id] || this.createTank(e), t.tank[0].style.top = e.position.y - e.dimension.height / 2 + "px", t.tank[0].style.left = e.position.x - e.dimension.width / 2 + "px", t.life[0].style.width = 30 * e.life / 100 + "px", this.applyRotate(t.body[0], e.angle), this.applyRotate(t.cannon[0], e.angle + e.cannonAngle)
    }, e.prototype.handleBullet = function (e)
    {
        var t;
        return t = this.objects[e.id], t.bullet[0].style.top = e.position.y - t.height / 2 + "px", t.bullet[0].style.left = e.position.x - t.width / 2 + "px", this.applyRotate(t.bullet[0], e.angle)
    }, e.prototype.removeBullet = function (e)
    {
        return delete this.objects[e.id], e.bullet.remove()
    }, e.prototype.processData = function(data)
    {
        if (this.options.data_callback)
        {
            this.options['data_callback'].call(this, data);
        }

    }, e.prototype.play = function (e)
    {
        var t, n, r, i, s, o, u, a, f, l, c, h, p, d, v;
        this.lastRound === null && (this.lastRound = e), i = e - this.lastRound, a = Math.floor(i / this.options.msPerRound), r = this.options.onRound, this.lastRound = e;
        for (u = f = 0; 0 <= a ? f <= a : f >= a; u = 0 <= a ? ++f : --f)
        {
            if (u + this.currentRound >= this.events.length)break;
            s = this.events[u + this.currentRound], r && r(s), d = s.objects;
            for (l = 0, h = d.length; l < h; l++)
            {
                n = d[l];
                switch (n.type)
                {
                    case"tank":
                        this.handleTank(n);
                        break;

                    case "data":
                        this.processData(n.data);
                        break;

                    case"bullet":
                        this.objects[n.id] || this.createBullet(n), this.handleBullet(n)
                }
            }
            v = s.events;
            for (c = 0, p = v.length; c < p; c++)
            {
                o = v[c], n = this.objects[o.id];
                if (!n)continue;
                switch (o.type)
                {
                    case"moving":
                        n.tank[0].className = "tank moving";
                        break;
                    case"backwards":
                        n.tank[0].className = "tank moving backwards";
                        break;
                    case"stopped":
                        n.tank[0].className = "tank";
                        break;
                    case"cloned":
                        n.tank[0].className = "tank cloning";
                        break;
                    case"beginInvisibility":
                        n.tank[0].className = "tank invisible";
                        break;
                    case"endInvisibility":
                        n.tank[0].className = "tank";
                        break;
                    case"exploded":
                        n.bullet[0].className = "bullet exploding", setTimeout(this.removeBullet.bind(this, n), 1e3);
                        break;
                    case"dead":
                        n.tank[0].className = "tank dead";
                        break;
                    case"log":
                        console.log.apply(console, ["ROBOT " + n.name + ":"].concat(o.messages))
                }
            }
        }
        t = a + this.currentRound >= this.events.length && this.gameEnded, t && this.options.onEndGame && this.options.onEndGame(this.result), this.currentRound += a;
        if (!t)return requestAnimationFrame(this.play)
    }, e
}();