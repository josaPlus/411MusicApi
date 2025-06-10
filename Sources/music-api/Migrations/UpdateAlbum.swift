
import Fluent

struct UpdateAlbum : AsyncMigration{
    func prepare(on database: any Database) async throws {
        try await database.schema("albums")
            .field("year", .string)
            .update()
    }
    
    func revert(on database: any Database) async throws {
        try await database.schema( "albums" )
            .deleteField("year")
            .update()
    }
}