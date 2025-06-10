import NIOSSL
import Fluent
import FluentMySQLDriver
import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

var tls = TLSConfiguration.makeClientConfiguration()
tls.certificateVerification = .none

app.databases.use(DatabaseConfigurationFactory.mysql(
    hostname: Environment.get("DATABASE_HOST")!,
    port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? 25060,
    username: Environment.get("DATABASE_USERNAME")!,
    password: Environment.get("DATABASE_PASSWORD")!,
    database: Environment.get("DATABASE_NAME")!,
    tlsConfiguration: tls
), as: .mysql)



    app.migrations.add(CreateAlbum())
    app.migrations.add(CreateArtist())
    app.migrations.add(UpdateAlbum())

    // register routes
    try routes(app)
}
