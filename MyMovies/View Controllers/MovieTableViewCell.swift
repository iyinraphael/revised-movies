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
    var movie: Movie? {
        didSet {
            updateView()
        }
    }
    

    //MARK: - Actions
    @IBAction func filmWatchedToggle(_ sender: Any) {
    }
    
    func updateView() {
        guard let movie = movie, let title = movie.title else { return }
        
        movieTitleLabel.text = title
        filmWatchedButton.setImage( movie.hasWatched ? UIImage(systemName: "film.filled") : UIImage(systemName: "film") , for: .normal)
    }
    
}
