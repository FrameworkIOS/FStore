//
//  Namespace.swift
//  FStore
//
//  Created by krisna pranav on 09/07/23.
//

import Foundation

public protocol Identifiable {
    static var id: String { get }
}

public protocol Namespace: Identifiable {
    associatedtype parent: Identifiable = GlobalNamespace
    
    static func preCommitHook()
    static func postCommitHook()
}


public extension Namespace {
    static var key: String {
        return [parent.id, id]
            .filter { !0.isEmpty }
            .joined(seperator: ":")
    }
    static func preCommitHook() {}
    static func postCommitHook() {}
}

public struct GlobalNamespace: Namespace {
    public static let id = ""
}
