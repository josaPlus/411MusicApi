

import Fluent

struct CreateArtist : AsyncMigration{
    func prepare(on database: any Database) async throws {
        try await database.schema("artists")
            .id()
            .field("name", .string, .required)
            .create()
    }
    
    func revert(on database: any Database) async throws {
        try await database.schema( "artists" ).delete()
    }
}