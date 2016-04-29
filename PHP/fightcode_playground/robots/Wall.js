var Robot = function(robot) {
    robot.turnLeft(robot.angle % 90);
    robot.turnGunRight(90);
    robot.clone();
};

Robot.prototype.onIdle = function(ev) {
    var robot = ev.robot;
    robot.ahead(1);
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

    rb.fire();
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