//
//  TicketBookViewController.swift
//  Tickets Here
//
//  Created by Parth Maru on 2023-04-16.
//

import Foundation
import UIKit

class TicketBookViewController: UIViewController{
    
    @IBOutlet weak var topTitle: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numofTicket: UITextField!
  //  @IBOutlet weak var numofTicket: UILabel!    
    @IBOutlet weak var locationMark: UIImageView!
    @IBOutlet weak var dateField: UILabel!
    @IBOutlet weak var theaterName: UILabel!
    @IBOutlet weak var bookButton: UIButton!
    
    var movie: Movie!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topTitle.text  = movie.name
        nameLabel.text = movie.name
        
    }
    
    @IBAction func bookButtonAction(_ sender: UIButton) {
        let content = UNMutableNotificationContent()
        content.title = "Movie: \(movie.name)"
        var tickets = numofTicket.text
        content.subtitle = tickets! + " tickets have been booked"
        content.sound = UNNotificationSound.default

        // show this notification five seconds from now
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)

        // choose a random identifier
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        // add our notification request
        UNUserNotificationCenter.current().add(request)
    }
    
}


