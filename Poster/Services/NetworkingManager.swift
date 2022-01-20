//
//  NetworkingManager.swift
//  Poster
//
//  Created by Александр Панин on 20.01.2022.
//

import Foundation

enum Link: String, CaseIterable {
    case kitsuApi = "https://kitsu.io/api/edge/anime?filter[text]=tokyo"
    case rickAndMortyApi = "https://rickandmortyapi.com/api/character"
}
