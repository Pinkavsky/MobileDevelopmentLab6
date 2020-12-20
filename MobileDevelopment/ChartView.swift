//
//  ChartView.swift
//  MobileDevelopment
//
//  Created by Bogdan Pinkavsky
//

import UIKit

class ChartView: UIView {

    var path: UIBezierPath!
    var path2: UIBezierPath!
     
    override init(frame: CGRect) {
        super.init(frame: frame)
     
        self.backgroundColor = UIColor.white
    }
     
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func createChart() {
        // Initialize the path.
        path = UIBezierPath()
        path2 = UIBezierPath()
        
        
        path.move(to: CGPoint(x: self.frame.size.width / 2, y: 0.0))
        path.addLine(to: CGPoint(x: self.frame.size.width / 2 - 10, y: 10))
        path.move(to: CGPoint(x: self.frame.size.width / 2, y: 0.0))
        path.addLine(to: CGPoint(x: self.frame.size.width / 2 + 10, y: 10))
        path.move(to: CGPoint(x: self.frame.size.width / 2, y: 0.0))
        path.addLine(to: CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height))
        
        path.move(to: CGPoint(x: 0, y: self.frame.size.height / 2))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height / 2))
        path.addLine(to: CGPoint(x: self.frame.size.width - 10, y: self.frame.size.height / 2 - 10))
        path.move(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height / 2))
        path.addLine(to: CGPoint(x: self.frame.size.width - 10, y: self.frame.size.height / 2 + 10))
        
        path.move(to: CGPoint(x: self.frame.size.width / 2 - 5, y: self.frame.size.height / 2 - 10))
        path.addLine(to: CGPoint(x: self.frame.size.width / 2 + 5, y: self.frame.size.height / 2 - 10))
        
        path.move(to: CGPoint(x: self.frame.size.width / 2 + 10, y: self.frame.size.height / 2 - 5))
        path.addLine(to: CGPoint(x: self.frame.size.width / 2 + 10, y: self.frame.size.height / 2 + 5))
        
        path.close()
        
        let graphWidth: CGFloat = 0.5  // Graph is 80% of the width of the view
        let amplitude: CGFloat = 0.1
        let origin = CGPoint(x: 0, y: self.frame.size.height / 2)

        path2.move(to: origin)

        for angle in stride(from: 0.0, through: 720.0, by: 1.0) {
            let x = origin.x + CGFloat(angle/360.0) * self.frame.size.width * graphWidth
            let y = origin.y - CGFloat(sin(angle/180.0 * Double.pi)) * self.frame.size.width * amplitude
            print()
            print(x)
            print(y)
            path2.addLine(to: CGPoint(x: x, y: y))
        }
     
        path2.close()
    }

    override func draw(_ rect: CGRect) {
        self.createChart()
     
        // Specify the fill color and apply it to the path.
     
        // Specify a border (stroke) color.
        UIColor.black.setStroke()
        path.stroke()
        
        UIColor.blue.setStroke()
        path2.stroke()
    }

}
