import Foundation

let ball = OvalShape(width: 50, height: 50)
let barrierWidth = 300.0
let barrierHeight = 25.0

let barrierPoints = [
Point(x: 0, y: 0),
Point(x: 0, y: barrierHeight),
Point(x: barrierWidth, y: barrierHeight),
Point(x: barrierWidth, y: 0)
]

let barrier = PolygonShape(points: barrierPoints)

let funnelPoints = [
Point(x: 0, y: 50),
Point(x: 80, y: 50),
Point(x: 60, y: 0),
Point(x: 20, y: 0)
]

let funnel = PolygonShape(points: funnelPoints)

let targetPoints = [
Point(x: 10, y: 0),
Point(x: 0, y: 10),
Point(x: 10, y: 20),
Point(x: 20, y: 10)
]

let target = PolygonShape(points: targetPoints)

fileprivate func setupBall() {
    ball.position = Point(x: 150, y: 350)
    ball.hasPhysics = true
    ball.fillColor = .purple
    ball.onCollision = ballCollided(with:)
    scene.add(ball)
}

fileprivate func setupBarrier() {
    barrier.position = Point(x: 100, y: 200)
    barrier.hasPhysics = true
    barrier.isImmobile = true
    barrier.fillColor = .blue
    scene.add(barrier)
}

fileprivate func setupFunnel() {
    funnel.position = Point(x: 200, y: scene.height-25)
    funnel.onTapped = dropBall //this is not call the function, just callback
    funnel.fillColor = .lightGray
    scene.add(funnel)
}

func setupTarget() {
    target.position = Point(x: 200, y: 400)
    target.isImmobile = true
    target.hasPhysics = true
    target.isImpermeable = true
    target.fillColor = .yellow
    target.name = "target"
    scene.add(target)
}

func setup() {
    setupBall()
    setupBarrier()
    setupFunnel()
    setupTarget()
}

func dropBall() {
    ball.position = funnel.position
}

func ballCollided(with otherShape: Shape) {
    if otherShape.name != "target" {return}
    otherShape.fillColor = .red
}

