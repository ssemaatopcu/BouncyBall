import Foundation

let circle = OvalShape(width: 150, height: 150)
let barrierWidth = 300.0
let barrierHeight = 25.0

let barrierPoints = [
Point(x: 0, y: 0),
Point(x: 0, y: barrierHeight),
Point(x: barrierWidth, y: barrierHeight),
Point(x: barrierWidth, y: 0)
]

let barrier = PolygonShape(points: barrierPoints)

func setup() {
    circle.position = Point(x: 150, y: 350)
    scene.add(circle)
    circle.hasPhysics = true
    
    barrier.position = Point(x: 100, y: 200)
    scene.add(barrier)
    barrier.hasPhysics = true
    
    barrier.isImmobile = true
}
