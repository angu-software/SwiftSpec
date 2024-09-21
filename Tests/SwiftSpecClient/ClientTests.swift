import Testing

import SwiftSpec

enum ExpandedSpec {

    // #define
    @Suite("NumberGenerator")
    struct NumberGeneratorTests {

        // #context
        @Suite("when generating a number")
        struct WhenCalled {

            // #it
            @Test("it returns a number between 0 and 10")
            func it_returns_a_number_between_0_and_10() async throws {
                #expect(true)
            }
        }
    }
}

enum MacroSpec {

    #define("NumberGenerator") {
        #context("when generating a number") {
            #it("it returns a number between 0 and 10") {
                #expect(false == true)
            }
        }
    }
}
