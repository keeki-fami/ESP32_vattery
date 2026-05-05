import Fluent
import SwiftUI
import Vapor
import struct Foundation.UUID

/// Property wrappers interact poorly with `Sendable` checking, causing a warning for the `@ID` property
/// It is recommended you write your model with sendability checking on and then suppress the warning
/// afterwards with `@unchecked Sendable`.
//final class Todo: Model, @unchecked Sendable {
//    static let schema = "todos"
//    
//    @ID(key: .id)
//    var id: UUID?
//
//    @Field(key: "title")
//    var title: String
//
//    init() { }
//
//    init(id: UUID? = nil, title: String) {
//        self.id = id
//        self.title = title
//    }
//    
//    func toDTO() -> TodoDTO {
//        .init(
//            id: self.id,
//            title: self.$title.value
//        )
//    }
//}

final class VoltData: Content, Model, @unchecked Sendable {
    static let schema = "voltdata"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "volt")
    var volt: String
    
    @Timestamp(key: "time", on: .create)
    var time: Date?
    
    init() { }
    
    init(id: UUID? = nil, volt: String, time: Date? = nil) {
        self.id = id
        self.volt = volt
        self.time = time
    }
}
