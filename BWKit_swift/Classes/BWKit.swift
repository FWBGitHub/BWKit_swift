//
//  BWKit.swift
//  BWKit
//
//  Created by fwb on 2021/3/5.
//

public protocol BWSpaceWrappable {
    associatedtype T
    var bw:T{get}
    static var bw:T.Type{get}
}
public struct BWSpace<Base> {
    public let base:Base
    public init(base:Base) {
        self.base = base
    }
}
extension BWSpaceWrappable{
    public var bw:BWSpace<Self>{
        return BWSpace<Self>(base: self)
    }
    public static var bw:BWSpace<Self>.Type{
        return BWSpace<Self>.self
    }
}

extension NSObject:BWSpaceWrappable{}
extension String:BWSpaceWrappable{}

public func BWPrint(_ item: @autoclosure () -> Any) {
    #if DEBUG
    print(item())
    #endif
}
