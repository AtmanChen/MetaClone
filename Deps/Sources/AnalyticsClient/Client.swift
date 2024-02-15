// The Swift Programming Language
// https://docs.swift.org/swift-book
import FirebaseAnalytics

public struct AnalyticsClient {
	public var logEvent: @Sendable (_ name: String, _ parameters: [String: Any]?) -> Void
}

public extension AnalyticsClient {
	func logScreen(screenName: String, of value: some Any) {
		logEvent(
			AnalyticsEventScreenView,
			[
				AnalyticsParameterScreenName: screenName,
				AnalyticsParameterScreenClass: String(describing: type(of: value))
			]
		)
	}
}

public extension AnalyticsClient {
	static let consoleLogger = Self(
		logEvent: { name, parameters in
			print("""
			Analytics: \(name)
			\(parameters ?? [:])
			""")
		}
	)
}
