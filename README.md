# SwiftSpec (WIP)

A RSpec inspired collection of swift macros

```swift
import Testing

import SwiftSpec

enum ExpandedSpec {

    // #define
    @Suite("NumberGenerator")
    struct NumberGeneratorTests {

        // #context
        @Suite(".generateNumber")
        struct GenerateNumberContext {

            // #when
            @Suite("when called")
            struct WhenCalled {

                // #it
                @Test("it should generate a number between 0 and 10")
                func it_should_generate_a_number_between_0_and_10() async throws {
                    #expect(false == true)
                }

                // #it
                @Test("it should generate a whole number")
                func it_should_generate_a_whole_number_between_0_and_10() async throws {
                    #expect(false == true)
                }
            }
        }
    }
}

enum MacroSpec {
    #define("NumberGenerator") {
        #context(".generateNumber") {
            #when("when called") {
                #it("it should generate a number between 0 and 10") {
                    #expect(false == true)
                }

                #it("it should generate a whole number") {
                    #expect(false == true)
                }
            }
        }
    }
}
```

![Test navigator view](./ReadmeResources/test_navigator.png)

## Learnings

_Swift 6.0_

* (freestanding) "'declaration' macros are not allowed to introduce arbitrary names at global scope".
  They must be nested within a type.

## Resources

* Blog on creating freestanding declaration macro: https://quickbirdstudios.com/blog/swift-macros/
* [Swift ADST Explorer](https://swift-ast-explorer.com/)
