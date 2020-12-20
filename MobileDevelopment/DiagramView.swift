//
//  DiagramView.swift
//  MobileDevelopment
//
//  Created by Bogdan Pinkavsky
//

import UIKit

class DiagramView: UIView {

    var path: UIBezierPath!
    var path2: UIBezierPath!
    var path3: UIBezierPath!
    var path4: UIBezierPath!
     
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
        path3 = UIBezierPath()
        path4 = UIBezierPath()
        
        let radius = self.frame.size.width / 2
        let center = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
        
        path.move(to: center)
        path.addArc(withCenter: center, radius: radius, startAngle: 3 * .pi / 2, endAngle: 0.0, clockwise: true)
        path.close()
        
        path2.move(to: center)
        path2.addArc(withCenter: center, radius: radius, startAngle: 0.0, endAngle: 2 * .pi / 5, clockwise: true)
        path2.close()
        
        path3.move(to: center)
        path3.addArc(withCenter: center, radius: radius, startAngle: 2 * .pi / 5, endAngle: 3 * .pi / 2, clockwise: true)
        path3.close()
        
        path4.move(to: center)
        path4.addArc(withCenter: center, radius: radius - 80.0, startAngle: 0.0, endAngle: 2 * .pi, clockwise: true)
        path4.close()
    }

    override func draw(_ rect: CGRect) {
        self.createChart()
     
        // Specify the fill color and apply it to the path.
     
        // Specify a border (stroke) color.
        UIColor.yellow.setFill()
        path.fill()
        
        UIColor.green.setFill()
        path2.fill()
        
        UIColor.red.setFill()
        path3.fill()
        
        UIColor.white.setFill()
        path4.fill()
    }

}
