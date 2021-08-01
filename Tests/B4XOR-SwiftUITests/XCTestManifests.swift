import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(B4XOR_SwiftUITests.allTests),
    ]
}
#endif
