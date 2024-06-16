import Foundation

let ball = OvalShape(width: 50, height: 50)
let barrierWidth = 300.0
let barrierHeight = 25.0
var barriers : [Shape] = []
var targets : [Shape] = []

let funnelPoints = [
Point(x: 0, y: 50),
Point(x: 80, y: 50),
Point(x: 60, y: 0),
Point(x: 20, y: 0)
]

let funnel = PolygonShape(points: funnelPoints)

fileprivate func setupBall() {
    ball.position = Point(x: 150, y: 350)
    ball.hasPhysics = true
    ball.fillColor = .purple
    ball.onCollision = ballCollided(with:)
    ball.isDraggable = false
    scene.trackShape(ball)
    ball.onExitedScene = ballExitedScene
    ball.onTapped = resetGame
    ball.bounciness = 0.6 //from 0 to 1
    scene.add(ball)
}

fileprivate func addBarrier(at position: Point, height: Double, width: Double, angle: Double) {
    let barrierPoints = [
    Point(x: 0, y: 0),
    Point(x: 0, y: height),
    Point(x: width, y: height),
    Point(x: width, y: 0)
    ]
    
    let barrier = PolygonShape(points: barrierPoints)
    barriers.append(barrier)

    barrier.position = position
    barrier.hasPhysics = true
    barrier.isImmobile = true
    barrier.fillColor = .blue
    barrier.isDraggable = true
    barrier.angle = angle
    scene.add(barrier)
}

fileprivate func setupFunnel() {
    funnel.position = Point(x: 200, y: scene.height-25)
    funnel.onTapped = dropBall //this is not call the function, just callback
    funnel.fillColor = .lightGray
    funnel.isDraggable = false
    scene.add(funnel)
}

func addTarget(at position: Point) {
    let targetPoints = [
    Point(x: 10, y: 0),
    Point(x: 0, y: 10),
    Point(x: 10, y: 20),
    Point(x: 20, y: 10)
    ]

    let target = PolygonShape(points: targetPoints)
    targets.append(target)
    
    target.position = position
    target.isImmobile = true
    target.hasPhysics = true
    target.isImpermeable = true
    target.fillColor = .yellow
    target.name = "target"
    //target.isDraggable = false
    scene.add(target)
}

func setup() {
    setupBall()
    addBarrier(at: Point(x: 175, y: 100), height: 25, width: 80, angle: 0.1)
    addBarrier(at: Point(x: 100, y: 150), height: 15, width: 30, angle: -0.2)
    addBarrier(at: Point(x: 325, y: 150), height: 25, width: 100, angle: 0.3)
    setupFunnel()
    addTarget(at: Point(x: 94, y: 175))
    addTarget(at: Point(x: 269, y: 453))
    addTarget(at: Point(x: 184, y: 563))
    addTarget(at: Point(x: 238, y: 624))
    resetGame()
    scene.onShapeMoved = printPosition(of:)
}

func dropBall() {
    ball.position = funnel.position
    ball.stopAllMotion()
    
    for barrier in barriers {
        barrier.isDraggable = false
    }
}

func ballCollided(with otherShape: Shape) {
    if otherShape.name != "target" {return}
    otherShape.fillColor = .red
}

func ballExitedScene() {
    for barrier in barriers {
        barrier.isDraggable = true
    }
}

func resetGame() {
    ball.position = Point(x: 0, y: -80)
}

func printPosition(of shape: Shape) {
    print(shape.position)
}
