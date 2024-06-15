import Foundation

let circle = OvalShape(width: 150, height: 150)

func setup() {
    circle.position = Point(x: 150, y: 350)
    scene.add(circle)
}
