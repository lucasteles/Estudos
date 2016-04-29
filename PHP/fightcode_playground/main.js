document.workerURL = "fightcode/fightcode_worker.js";

$(function(){
    $.when(
        $.get('get_robot_code.php', {file : 'Wall.js'}),
        $.get('get_robot_code.php', {file : 'Wall.js'})
    ).done(function(r1, r2) {
            var player = {
                name: "player",
                code: '"use strict";' + r1[2].responseText,
                color: "#00FF00"
            };

            var enemy = {
                name: "enemy",
                code: '"use strict";' + r2[2].responseText,
                color: "#FF0000"
            };

            var container = $('#container');
            var options = {
                maxRounds: 100000,
                boardSize: {
                    width: container.width(),
                    height: container.height()
                },
                streaming: true,

                // This is a new added option - callback for custom user data handling
                // Use ev.robot.data() function to send data from your robot to the "replay player"
                data_callback: illustrateData
            };

            var arena = new FightArena(container, [player, enemy], null, function(error) {
                console.log(error);
            }, options);
    }).fail(function(){
        console.log('Ajax request failed');
    });

});

/**
 * Callback for handling custom user data from the robot.
 * In the robot code use ev.robot.data(some_data) to send the data.
 *
 * "this" is a 'Game' object.
 *
 * This simple example highlights the position where the enemy has been last
 * seen with a square.
 *
 * Look at the onScannedRobot() in Seeker.js and Wall.js to find out how to send the data.
 *
 * @param data
 */
function illustrateData(data)
{
    if ('enemy' in data)
    {
        var enemy = data.enemy;

        // Illustrate enemy position
        var id = enemy.id + '-shadow';
        var shadow = $('#' + id);
        if ( ! shadow.length)
        {
            shadow = $('<div class="tank-shadow' + (enemy.parentId != null ? ' clone' : '') + '" id="' + id + '"></div>');
            this.board.append(shadow)
        }

        shadow.show();

        shadow.css({
            left : enemy.position.x - shadow.width() / 2,
            top  : enemy.position.y - shadow.height() / 2
        });
    }
}