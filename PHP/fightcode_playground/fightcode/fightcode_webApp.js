var FightArena, __bind = function (e, t)
{
    return function ()
    {
        return e.apply(t, arguments)
    }
};
FightArena = function ()
{
    function e(e, t, n, r, i)
    {
        this.container = e, this.robots = t, this.onRound = n, this.onError = r, this.receiveWorkerEvent = __bind(this.receiveWorkerEvent, this), this.options = $.extend({}, this.options, i), this.terminated = !1, this.worker = null, this.game = null, this.startWorker()
    }

    return e.prototype.options = {maxRounds: 1e4, onEndGame: function (e)
    {
    },
    boardSize: {width: 800, height: 500}},
    e.prototype.startWorker = function ()
    {
        if (this.worker)
            return this.worker;

        this.worker = new Worker(document.workerURL);
        this.worker.onmessage = this.receiveWorkerEvent;

        var game_options = {
            robots: this.robots.length,
            robot1: this.robots[0],
            robot2: this.robots[1],
            streaming: this.options.streaming,
            maxRounds: this.options.maxRounds,
            boardSize: {
                width:  this.options.boardSize.width,
                height: this.options.boardSize.height
            }
        };

        if (this.options.streaming)
        {
            this.startGame();
        }

        this.worker.postMessage(game_options)

        return this.worker;
    },
    e.prototype.startGame = function (result)
    {
        var container, board;
        if (this.game)
        {
            this.game.end();
            return
        }
        container = this.container.find(".board");
        container.empty();
        board = $("<div></div>");
        container.append(board);

        this.game = new Game(board, result, {
            msPerRound: 5,
            onRound: this.onRound,
            onEndGame: this.options.onEndGame,
            data_callback: ('data_callback' in this.options ? this.options['data_callback'] : null)
        });

        return this.game.start();
    }, e.prototype.stop = function ()
    {
        return this.terminated = !0, this.worker.terminate(), this.game && this.game.forceEnd()
    }, e.prototype.receiveWorkerEvent = function (e)
    {
        var t;
        if (this.terminated)
            return;

        t = e.data;

        if (t.type === "log")
            console.log("LOG", t.message);

        if (t.type === "error" && this.onError)
            this.onError(t.error);

        if (t.type === "stream")
            this.game.addRound(t.roundLog);

        if (t.type === "results")
            return this.startGame(t);
    }, e
}();