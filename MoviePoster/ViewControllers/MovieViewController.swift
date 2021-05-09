//
//  MovieViewController.swift
//  MoviePoster
//
//  Created by Елена Дранкина on 03.05.2021.
//
//
import UIKit

class MovieViewController: UIViewController {
    
    var movies: [Movie]!
    var openedMovie: Movie?
    var movieId: Int!

    @IBOutlet var imageView: MovieImageView! {
    didSet {
        imageView.layer.cornerRadius = 15
           }
    }
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var genreLabel: UILabel!
    @IBOutlet var directorLabel: UILabel!
    @IBOutlet var castLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        findTheMovie(movies: movies, with: movieId)
        fillTheMovie()
        imageView.fetchImage(from: openedMovie?.image ?? "xmark.shield")
    }

    private func fillTheMovie() {
    
        nameLabel.text = openedMovie?.name
        yearLabel.text = "Год производства: \(openedMovie?.year ?? 0)"
        countryLabel.text = "Страна: \(openedMovie?.country ?? "")"
        genreLabel.text = "Жанр: \(openedMovie?.genre ?? "")"
        directorLabel.text = "Режиссер: \(openedMovie?.director ?? "")"
        castLabel.text = "В ролях: \(openedMovie?.cast ?? "")"
        descriptionLabel.text = openedMovie?.description ?? ""
        
    }
    
    private func findTheMovie(movies: [Movie], with id: Int) {
        for movie in movies {
            if movie.id == id {
                openedMovie = movie
            }
        }
    }
    
}


