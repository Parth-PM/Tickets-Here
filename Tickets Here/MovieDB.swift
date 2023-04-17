//
//  MovieDB.swift
//  Tickets Here
//
//  Created by Parth Maru on 2023-04-15.
//

import Foundation
import UIKit
class MovieDB {
    static let shared = MovieDB()
    
    var allMovies: [Movie] = []
    
    private init() {
        createMovies()
        
    }
    
    private func createMovies() {
        readJsonFile()
    }
 
    private func readJsonFile() {
        if let path = Bundle.main.path(forResource: "movies", ofType: "json") {
            do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                  let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                  if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let movies = jsonResult["movies"] as? NSArray {
                     debugPrint(movies)
                      allMovies = []
                      for movie in movies {
                          if let dict = movie as? Dictionary<String, AnyObject> {
                              let actors = dict["actors"] as? String ?? ""
                          let director = dict["director"] as? String ?? ""
                          let genres = ((dict["genres"] as? [String]) ?? []).joined(separator: ",")
                          let plot = dict["plot"] as? String ?? ""
                          let poster = dict["posterUrl"] as? String ?? ""
                          let runTime = dict["runtime"] as? Int ?? 0
                          let title = dict["title"] as? String ?? ""
                          let year = dict["year"] as? Int ?? 0
                              
                              let movie = Movie(name: title, imageName: poster, director: director, cast: actors, length: (runTime * 60).secondsToTime(), date: String(year), type: genres, plot:plot)
                              allMovies.append(movie)
                          }
                      }
                  }
              } catch {
                   // handle error
              }
        }
    }
    
}


extension Int {

    func secondsToTime() -> String {

        let (h,m,s) = (self / 3600, (self % 3600) / 60, (self % 3600) % 60)

        let h_string = h < 10 ? "0\(h)" : "\(h)"
        let m_string =  m < 10 ? "0\(m)" : "\(m)"
        let s_string =  s < 10 ? "0\(s)" : "\(s)"

        return "\(h_string):\(m_string):\(s_string)"
    }
}


extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}


