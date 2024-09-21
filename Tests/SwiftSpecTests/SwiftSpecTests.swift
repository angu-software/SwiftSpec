import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest

// Macro implementations build for the host, so the corresponding module is not available when cross-compiling. Cross-compiled tests may still make use of the macro itself in end-to-end tests.
#if canImport(SwiftSpecMacros)
import SwiftSpecMacros
#endif

final class SwiftSpecTests: XCTestCase {

    private var testMacros: [String: Macro.Type] = [:]

    override func setUp() async throws {
        try await super.setUp()

        #if canImport(SwiftSpecMacros)
        testMacros = [
            "define": DefineMacro.self,
            "context": ContextMacro.self,
            "it": ItMacro.self,
            "test": TestMacro.self
        ]
        #else
        throw XCTSkip("macros are only supported when running tests for the host platform")
        #endif
    }

    func test_exploration() {
        assertMacroExpansion(
            #"""
            #test("MyType") {
                // FOO
            }
            """#,
            expandedSource: #"""
            @Suite("MyType")
            struct MyTypeTests {
                // FOO
            }
            """#,
            macros: testMacros
        )
    }

    func test_should_expand_nested_macros() throws {
        assertMacroExpansion(
            #"""
            #define("NumberGenerator") {
                #context("when generating a number") {
                    #it("it returns a number between 0 and 10") {
                        #expect(false == true)
                    }
                }
            }
            """#,
            expandedSource: #"""
            @Suite("NumberGenerator")
            struct NumberGeneratorTests {
                @Suite("when generating a number")
                struct WhenGeneratingANumberContext {
                        @Test("it should do something")
                        func it_should_do_something() async throws {
                                        #expect(false == true)
                                    }
                    }
            }
            """#,
            macros: testMacros
        )
    }
}
