//
//  TableViewCell.swift
//  MoviePoster
//
//  Created by Елена Дранкина on 07.05.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var movieImage: MovieImageView! {
        didSet {
            movieImage.layer.cornerRadius = 15
        }
    }
    
    @IBOutlet var movieNameLabel: UILabel!
    @IBOutlet var movieYearLabel: UILabel!
    @IBOutlet var movieGenreLabel: UILabel!
    
    func configure(with movie: Movie?) {
        movieNameLabel.text = movie?.name
        movieYearLabel.text = "Год производства: \(movie?.year ?? 0)"
        movieGenreLabel.text = "Жанр: \(movie?.genre ?? "")"
        movieImage.fetchImage(from: movie?.image ?? "")
        
    }
}
