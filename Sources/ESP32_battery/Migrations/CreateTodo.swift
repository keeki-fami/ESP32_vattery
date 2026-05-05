import Fluent

struct CreateTodo: AsyncMigration {
    func prepare(on database: any Database) async throws {
        try await database.schema("todos")
            .id()
            .field("title", .string, .required)
            .create()
    }

    func revert(on database: any Database) async throws {
        try await database.schema("todos").delete()
    }
}

struct CreateVoltData: AsyncMigration {
    func prepare(on database: any Database) async throws {
        try await database.schema("voltdata")
            .id()
            .field("volt", .string)
            .field("time", .datetime)
            .create()
    }
    
    func revert(on database: any Database) async throws {
        try await database.schema("voltdata").delete()
    }
}
