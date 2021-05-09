//
//  MainTableViewController.swift
//  MoviePoster
//
//  Created by Елена Дранкина on 02.05.2021.
//

import UIKit


class MovieListViewController: UITableViewController {
    
    
    var movies: [Movie]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData(from: MovieUrl.moviesapi.rawValue)
    }



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieId", for: indexPath) as! TableViewCell
        let result = movies?[indexPath.row]
        cell.configure(with: result)

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
        let movieVC = segue.destination as! MovieViewController
        movieVC.movieId = movies?[indexPath.row].id
            if movies != nil {
                movieVC.movies = movies!
            } else { return }
        }
    }
    
    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchData(from: url) { (movies) in
            self.movies = movies
            self.tableView.reloadData()
        }
    }
}


