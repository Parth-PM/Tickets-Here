//
//  MovieCollectionViewCell.swift
//  Tickets Here
//
//  Created by Parth Maru on 2023-04-15.
//

import Foundation
import UIKit

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var movieLabel: UILabel!
    
    func set(movie: Movie) {
        imageView.downloaded(from: movie.imageName, contentMode: .scaleToFill)
            movieLabel.text = movie.name
    }
    
}
