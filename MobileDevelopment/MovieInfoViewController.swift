//
//  MovieInfoViewController.swift
//  MobileDevelopment
//
//  Created by Bogdan Pinkavsky
//

import UIKit

class MovieInfoViewController: UIViewController {
    var movieName = ""
    var movieYear = ""
    var movieType = ""
    var moviePoster: UIImage = UIImage(named: "Poster_01")!
    
    @IBOutlet weak var poster: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var type: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = movieName
        year.text = movieYear
        type.text = movieType
        poster.image = moviePoster
        
    }
    
}
