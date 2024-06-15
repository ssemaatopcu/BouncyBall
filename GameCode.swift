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

fileprivate func setupBall() {
    ball.position = Point(x: 150, y: 350)
    scene.add(ball)
    ball.hasPhysics = true
    ball.fillColor = .purple
}

fileprivate func setupBarrier() {
    barrier.position = Point(x: 100, y: 200)
    scene.add(barrier)
    barrier.hasPhysics = true
    barrier.isImmobile = true
    barrier.fillColor = .blue
}

fileprivate func setupFunnel() {
    funnel.position = Point(x: 200, y: scene.height-25)
    scene.add(funnel)
    funnel.onTapped = dropBall //this is not call the function, just callback
    funnel.fillColor = .green
}

func setup() {
    setupBall()
    
    setupBarrier()
    
    setupFunnel()
}

func dropBall() {
    ball.position = funnel.position
}
