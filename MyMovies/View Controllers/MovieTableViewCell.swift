//
//  MovieTableViewCell.swift
//  MyMovies
//
//  Created by Iyin Raphael on 6/4/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    //MARK: - Properties
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var filmWatchedButton: UIButton!
    

    
    @IBAction func filmWatchedToggle(_ sender: Any) {
    }
}
