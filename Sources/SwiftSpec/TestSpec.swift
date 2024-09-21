//
//  TestSpec.swift
//  SwiftSpec
//
//  Created by Andreas Guenther on 21.09.24.
//

#if canImport(Testing)
@freestanding(declaration, names: arbitrary)
public macro test(_ label: StaticString,
                  _ body: @escaping () -> Void) = #externalMacro(module: "SwiftSpecMacros",
                                                                 type: "TestMacro")
#endif
