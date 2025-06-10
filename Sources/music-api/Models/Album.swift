//
//  Album.swift
//  music-api
//
//  Created by Juan Frausto on 26/05/25.
//

import Foundation
import Fluent

final class Album : Model, @unchecked Sendable {
    
    static let schema = "albums"
    
    @ID(custom: "id", generatedBy: .database)
    var id: UUID?
    
    @Field(key:"title")
    var title : String
    
    @Field(key:"description")
    var description : String
    
    @Field(key:"artist")
    var artist : String
    
    @Field(key:"image")
    var image : String
    
    init(){}
    
    init(id:UUID? = nil, title: String, artist:String,description:String, image:String){
        self.id = id
        self.title = title
        self.description = description
        self.image = image
        self.artist = artist
    }
}