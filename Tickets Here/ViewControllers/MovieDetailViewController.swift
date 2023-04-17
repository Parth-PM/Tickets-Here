//
//  MovieDetailViewController.swift
//  Tickets Here
//
//  Created by Parth Maru on 2023-04-15.
//

import Foundation
import UIKit

class MovieDetailViewController: UIViewController{
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var getTicketButton: UIButton!
    @IBOutlet weak var castDetailLabel: UILabel!
    @IBOutlet weak var directorNameLabel: UILabel!
    
    
    var selectedMovie: Movie!
    override func viewDidLoad() {
        super.viewDidLoad()
        setMovie()
 
    }
    private func setMovie() {
        nameLabel.text = selectedMovie.name
        //dateLabel.text = selectedMovie.date
       // lengthLabel.text = selectedMovie.length
        genresLabel.text = selectedMovie.type
        posterImageView.downloaded(from: selectedMovie.imageName)
        castDetailLabel.text = selectedMovie.cast
        directorNameLabel.text = selectedMovie.director
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if let bookVC = segue.destination as? TicketBookViewController {
           bookVC.movie = selectedMovie
        }
    }
    
    @IBAction func getTicketButtonAction(_ sender: UIButton) {
    }
}
