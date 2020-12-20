//
//  SegmentedViewController.swift
//  MobileDevelopment
//
//  Created by Bogdan Pinkavsky
//

import UIKit

class SegmentedViewController: UIViewController {
    var diagramView: DiagramView?
    var chartView: ChartView?

    override func viewDidLoad() {
        let bounds: CGRect = UIScreen.main.bounds
        let width: CGFloat = bounds.width - 50
        let height: CGFloat = 450.0

        diagramView = DiagramView(frame: CGRect(x: self.view.frame.size.width/2 - width/2,
                                              y: self.view.frame.size.height/2 - height/2,
                                              width: width,
                                              height: height))
        
        chartView = ChartView(frame: CGRect(x: self.view.frame.size.width/2 - width/2,
                                                  y: self.view.frame.size.height/2 - height/2,
                                                  width: width,
                                                  height: height))

        self.view.addSubview(diagramView!)
        self.view.addSubview(chartView!)
    }

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func indexChanged(_ sender: Any) {
        
        let index = segmentedControl.selectedSegmentIndex
        
        switch (index) {
        case 0:
            diagramView!.isHidden = true
            chartView!.isHidden = false
        case 1:
            diagramView!.isHidden = false
            chartView!.isHidden = true
        default:
            diagramView!.isHidden = true
            chartView!.isHidden = true
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
