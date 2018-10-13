// Generated using Sourcery 0.15.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


//swiftlint:disable force_cast
//swiftlint:disable function_body_length
//swiftlint:disable line_length
//swiftlint:disable vertical_whitespace

#if MockyCustom
import SwiftyMocky
@testable import iOS_Test

    public final class MockyAssertion {
        public static var handler: ((Bool, String, StaticString, UInt) -> Void)?
    }

    func MockyAssert(_ expression: @autoclosure () -> Bool, _ message: @autoclosure () -> String = "Verification failed", file: StaticString = #file, line: UInt = #line) {
        guard let handler = MockyAssertion.handler else {
            assert(expression, message, file: file, line: line)
            return
        }

        handler(expression(), message(), file, line)
    }
#elseif Mocky
import SwiftyMocky
import XCTest
@testable import iOS_Test

    func MockyAssert(_ expression: @autoclosure () -> Bool, _ message: @autoclosure () -> String = "Verification failed", file: StaticString = #file, line: UInt = #line) {
        XCTAssert(expression(), message(), file: file, line: line)
    }
#else
import Sourcery
import SourceryRuntime
#endif



// MARK: - UserModelProtocol
class UserModelProtocolMock: UserModelProtocol, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    typealias PropertyStub = Given
    typealias MethodStub = Given
    typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    var delegate: UserModelDelegate? {
		get {	invocations.append(.p_delegate_get); return __p_delegate ?? optionalGivenGetterValue(.p_delegate_get, "UserModelProtocolMock - stub value for delegate was not defined") }
		set {	invocations.append(.p_delegate_set(.value(newValue))); __p_delegate = newValue }
	}
	private var __p_delegate: (UserModelDelegate)?





    func fetchUser() {
        addInvocation(.m_fetchUser)
		let perform = methodPerformValue(.m_fetchUser) as? () -> Void
		perform?()
    }


    fileprivate enum MethodType {
        case m_fetchUser
        case p_delegate_get
		case p_delegate_set(Parameter<UserModelDelegate?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_fetchUser, .m_fetchUser):
                return true 
            case (.p_delegate_get,.p_delegate_get): return true
			case (.p_delegate_set(let left),.p_delegate_set(let right)): return Parameter<UserModelDelegate?>.compare(lhs: left, rhs: right, with: matcher)
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_fetchUser: return 0
            case .p_delegate_get: return 0
			case .p_delegate_set(let newValue): return newValue.intValue
            }
        }
    }

    class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [Product]) {
            self.method = method
            super.init(products)
        }

        static func delegate(getter defaultValue: UserModelDelegate?...) -> PropertyStub {
            return Given(method: .p_delegate_get, products: defaultValue.map({ Product.return($0) }))
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func fetchUser() -> Verify { return Verify(method: .m_fetchUser)}
        static var delegate: Verify { return Verify(method: .p_delegate_get) }
		static func delegate(set newValue: Parameter<UserModelDelegate?>) -> Verify { return Verify(method: .p_delegate_set(newValue)) }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func fetchUser(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_fetchUser, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> Product {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - UserServiceProtocol
class UserServiceProtocolMock: UserServiceProtocol, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    typealias PropertyStub = Given
    typealias MethodStub = Given
    typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }





    func getUser() -> User {
        addInvocation(.m_getUser)
		let perform = methodPerformValue(.m_getUser) as? () -> Void
		perform?()
		var __value: User
		do {
		    __value = try methodReturnValue(.m_getUser).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getUser(). Use given")
			Failure("Stub return value not specified for getUser(). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_getUser

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_getUser, .m_getUser):
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_getUser: return 0
            }
        }
    }

    class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [Product]) {
            self.method = method
            super.init(products)
        }


        static func getUser(willReturn: User...) -> MethodStub {
            return Given(method: .m_getUser, products: willReturn.map({ Product.return($0) }))
        }
        static func getUser(willProduce: (Stubber<User>) -> Void) -> MethodStub {
            let willReturn: [User] = []
			let given: Given = { return Given(method: .m_getUser, products: willReturn.map({ Product.return($0) })) }()
			let stubber = given.stub(for: (User).self)
			willProduce(stubber)
			return given
        }
    }

    struct Verify {
        fileprivate var method: MethodType

        static func getUser() -> Verify { return Verify(method: .m_getUser)}
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func getUser(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_getUser, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> Product {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - UserViewControllerProtocol
class UserViewControllerProtocolMock: UserViewControllerProtocol, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    typealias PropertyStub = Given
    typealias MethodStub = Given
    typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    var viewModel: UserViewModelProtocol! {
		get {	invocations.append(.p_viewModel_get); return __p_viewModel ?? optionalGivenGetterValue(.p_viewModel_get, "UserViewControllerProtocolMock - stub value for viewModel was not defined") }
		set {	invocations.append(.p_viewModel_set(.value(newValue))); __p_viewModel = newValue }
	}
	private var __p_viewModel: (UserViewModelProtocol)?





    func userFetchOnSuccess(user: User) {
        addInvocation(.m_userFetchOnSuccess__user_user(Parameter<User>.value(`user`)))
		let perform = methodPerformValue(.m_userFetchOnSuccess__user_user(Parameter<User>.value(`user`))) as? (User) -> Void
		perform?(`user`)
    }

    func userFetchOnError() {
        addInvocation(.m_userFetchOnError)
		let perform = methodPerformValue(.m_userFetchOnError) as? () -> Void
		perform?()
    }


    fileprivate enum MethodType {
        case m_userFetchOnSuccess__user_user(Parameter<User>)
        case m_userFetchOnError
        case p_viewModel_get
		case p_viewModel_set(Parameter<UserViewModelProtocol?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_userFetchOnSuccess__user_user(let lhsUser), .m_userFetchOnSuccess__user_user(let rhsUser)):
                guard Parameter.compare(lhs: lhsUser, rhs: rhsUser, with: matcher) else { return false } 
                return true 
            case (.m_userFetchOnError, .m_userFetchOnError):
                return true 
            case (.p_viewModel_get,.p_viewModel_get): return true
			case (.p_viewModel_set(let left),.p_viewModel_set(let right)): return Parameter<UserViewModelProtocol?>.compare(lhs: left, rhs: right, with: matcher)
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_userFetchOnSuccess__user_user(p0): return p0.intValue
            case .m_userFetchOnError: return 0
            case .p_viewModel_get: return 0
			case .p_viewModel_set(let newValue): return newValue.intValue
            }
        }
    }

    class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [Product]) {
            self.method = method
            super.init(products)
        }

        static func viewModel(getter defaultValue: UserViewModelProtocol?...) -> PropertyStub {
            return Given(method: .p_viewModel_get, products: defaultValue.map({ Product.return($0) }))
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func userFetchOnSuccess(user: Parameter<User>) -> Verify { return Verify(method: .m_userFetchOnSuccess__user_user(`user`))}
        static func userFetchOnError() -> Verify { return Verify(method: .m_userFetchOnError)}
        static var viewModel: Verify { return Verify(method: .p_viewModel_get) }
		static func viewModel(set newValue: Parameter<UserViewModelProtocol?>) -> Verify { return Verify(method: .p_viewModel_set(newValue)) }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func userFetchOnSuccess(user: Parameter<User>, perform: @escaping (User) -> Void) -> Perform {
            return Perform(method: .m_userFetchOnSuccess__user_user(`user`), performs: perform)
        }
        static func userFetchOnError(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_userFetchOnError, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> Product {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - UserViewModelProtocol
class UserViewModelProtocolMock: UserViewModelProtocol, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    typealias PropertyStub = Given
    typealias MethodStub = Given
    typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    var delegate: UserViewModelDelegate? {
		get {	invocations.append(.p_delegate_get); return __p_delegate ?? optionalGivenGetterValue(.p_delegate_get, "UserViewModelProtocolMock - stub value for delegate was not defined") }
		set {	invocations.append(.p_delegate_set(.value(newValue))); __p_delegate = newValue }
	}
	private var __p_delegate: (UserViewModelDelegate)?





    func fetchUser() {
        addInvocation(.m_fetchUser)
		let perform = methodPerformValue(.m_fetchUser) as? () -> Void
		perform?()
    }

    func userFetchOnSuccess(user: User) {
        addInvocation(.m_userFetchOnSuccess__user_user(Parameter<User>.value(`user`)))
		let perform = methodPerformValue(.m_userFetchOnSuccess__user_user(Parameter<User>.value(`user`))) as? (User) -> Void
		perform?(`user`)
    }

    func userFetchOnError() {
        addInvocation(.m_userFetchOnError)
		let perform = methodPerformValue(.m_userFetchOnError) as? () -> Void
		perform?()
    }


    fileprivate enum MethodType {
        case m_fetchUser
        case m_userFetchOnSuccess__user_user(Parameter<User>)
        case m_userFetchOnError
        case p_delegate_get
		case p_delegate_set(Parameter<UserViewModelDelegate?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_fetchUser, .m_fetchUser):
                return true 
            case (.m_userFetchOnSuccess__user_user(let lhsUser), .m_userFetchOnSuccess__user_user(let rhsUser)):
                guard Parameter.compare(lhs: lhsUser, rhs: rhsUser, with: matcher) else { return false } 
                return true 
            case (.m_userFetchOnError, .m_userFetchOnError):
                return true 
            case (.p_delegate_get,.p_delegate_get): return true
			case (.p_delegate_set(let left),.p_delegate_set(let right)): return Parameter<UserViewModelDelegate?>.compare(lhs: left, rhs: right, with: matcher)
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_fetchUser: return 0
            case let .m_userFetchOnSuccess__user_user(p0): return p0.intValue
            case .m_userFetchOnError: return 0
            case .p_delegate_get: return 0
			case .p_delegate_set(let newValue): return newValue.intValue
            }
        }
    }

    class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [Product]) {
            self.method = method
            super.init(products)
        }

        static func delegate(getter defaultValue: UserViewModelDelegate?...) -> PropertyStub {
            return Given(method: .p_delegate_get, products: defaultValue.map({ Product.return($0) }))
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func fetchUser() -> Verify { return Verify(method: .m_fetchUser)}
        static func userFetchOnSuccess(user: Parameter<User>) -> Verify { return Verify(method: .m_userFetchOnSuccess__user_user(`user`))}
        static func userFetchOnError() -> Verify { return Verify(method: .m_userFetchOnError)}
        static var delegate: Verify { return Verify(method: .p_delegate_get) }
		static func delegate(set newValue: Parameter<UserViewModelDelegate?>) -> Verify { return Verify(method: .p_delegate_set(newValue)) }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func fetchUser(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_fetchUser, performs: perform)
        }
        static func userFetchOnSuccess(user: Parameter<User>, perform: @escaping (User) -> Void) -> Perform {
            return Perform(method: .m_userFetchOnSuccess__user_user(`user`), performs: perform)
        }
        static func userFetchOnError(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_userFetchOnError, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> Product {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

