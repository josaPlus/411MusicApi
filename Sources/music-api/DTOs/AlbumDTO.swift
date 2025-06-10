//
//  AlbumDTO.swift
//  music-api
//
//  Created by Juan Frausto on 26/05/25.
//
import Vapor
import Foundation

struct AlbumDTO : Content{
    var id : UUID?
    var title : String
    var artist : String
    var image : String
    var description : String
}