// The Swift Programming Language
// https://docs.swift.org/swift-book

//
//  ContextSpec.swift
//  SwiftSpec
//
//  Created by Andreas Guenther on 21.09.24.
//

#if canImport(Testing)
@freestanding(declaration, names: arbitrary)
public macro context(_ label: StaticString,
                     _ body: @escaping () -> Void) = #externalMacro(module: "SwiftSpecMacros",
                                                                    type: "ContextMacro")
#endif
