function inherit(p) {
    if (p == null) throw TypeError();

    if (Object.create) return Object.create(p);

    var t = typeof p;

    if (t !== "object" && t !== "function") throw TypeError();

    function f() {};
    f.prototype = p;
    return new f();
}

function enumeration(namesToValues) {
    var enumeration = function() { throw "Cant instantiate enumerators"; };

    var proto = enumeration.prototype = {
        constructor: enumeration,
        toString: function () { return this.name; },
        valueOf: function () { return this.value; },
        toJSON: function () { return this.name; }
    };

    enumeration.values = [];

    for (name in namesToValues) {
        var e = inherit(proto);
        e.name = name;
        e.value = namesToValues[name];
        enumeration.values.push(e);
    }

    enumeration.foreach = function(fn,context) {
        var n = this.values.length;
        for (var i = 0; i < n; i++) {
            fn.call(context, this.values[i]);
        }
    }

    return enumeration;
}

// card definition
function Card(suit, rank) {
    this.suit = suit;
    this.rank = rank;
}

Card.Suit = enumeration({Clubs:1, Diamonds:2, Hearts:3, Spades:4});

Card.Suit.foreach(function(v){
    console.log(v.toString(), v.valueOf());
})