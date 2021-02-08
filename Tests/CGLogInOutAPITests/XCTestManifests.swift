import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(CGLogInOutAPITests.allTests),
    ]
}
#endif
