//
//  movie.swift
//  MoviePoster
//
//  Created by Елена Дранкина on 02.05.2021.
//


struct Movie: Decodable {
    let id: Int?
    let name: String?
    let genre: String?
    let year: Int?
    let country: String?
    let director: String?
    let cast: String?
    let description: String?
    let image: String?
}

enum MovieUrl: String {
    case moviesapi = "https://www.drankin.ru/jena.php"
}

