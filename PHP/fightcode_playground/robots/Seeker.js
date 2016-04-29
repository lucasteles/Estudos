var Robot = function(robot) {
    robot.clone();
};

Robot.prototype.onIdle = function(ev) {
    var robot = ev.robot;
    robot.turn(1);
};

Robot.prototype.onWallCollision = function(ev) {
    var robot = ev.robot;
    robot.turn(ev.bearing + 90);
};

Robot.prototype.onScannedRobot = function(ev) {
    var rb = ev.robot, scanned = ev.scannedRobot;

    if (scanned.id == rb.parentId ||
        scanned.parentId == rb.id) {
        return;
    }

    // A new function data() is added. It will send the data you provided to
    // the player.
    // See ../main.js for an example on how to receive and handle it
    rb.data({
        enemy : scanned
    })

    for (var i=0; i<5; i++) {
        rb.fire();
        rb.ahead(10);
    }
};

Robot.prototype.onRobotCollision = function(ev) {
    var robot = ev.robot, collidedRobot = ev.collidedRobot;
    if (!ev.myFault) {
        return;
    }

    if (ev.bearing > -90 && ev.bearing < 90) {
        robot.back(100);
    } else {
        robot.ahead(100);
    }
};