//
//  AlbumController.swift
//  music-api
// SOAP XML y JSON Swift
//  Created by Juan Frausto on 26/05/25.
// http://localhost:8080/albums

import Vapor
import Fluent

struct AlbumController : RouteCollection {
    
    func boot(routes: any RoutesBuilder) throws {
        let albums = routes.grouped("albums")
        
        albums.get(use: self.getAlbums)
        albums.post(use: self.create)
        
    }
    
    func create(req: Request) async throws -> AlbumDTO{
        let dto = try req.content.decode(AlbumDTO.self)
        let album = Album(id: dto.id, title: dto.title, artist: dto.artist, description: dto.description, image: dto.image)
        try await album.save(on: req.db)
        return dto
    }
    
    func getAlbums(req: Request) async throws -> [AlbumDTO] {
        var albumsMock : [AlbumDTO] = []
        let albumsDB = try await Album.query(on:req.db).all()
        albumsDB.forEach{ album in
            var albumDTO = AlbumDTO(id: album.id, title: album.title, artist: album.artist, image: album.image, description: album.description)
            albumsMock.append(albumDTO)
        }
        return albumsMock
    }
    
}