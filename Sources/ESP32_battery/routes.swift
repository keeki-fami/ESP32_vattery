import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }
    
    app.get("hello") { req async -> String in
        "Hello, world!"
    }
    
    app.post("addData") { req async throws -> HTTPStatus in
        do {
            let voltInfo = try req.content.decode(VoltData.self)
            let adddata = VoltData(id: UUID(), volt: voltInfo.volt, time: voltInfo.time)
            try await adddata.save(on: req.db)
        } catch {
            return HTTPStatus.badRequest
        }
        return HTTPStatus.ok
    }
    
    app.get("fetchData") { req async throws-> [VoltData] in
        let data = try await VoltData.query(on: req.db).sort(\.$time, .ascending).all()
        return data
    }
    
//    try app.register(collection: VoltController())
}
