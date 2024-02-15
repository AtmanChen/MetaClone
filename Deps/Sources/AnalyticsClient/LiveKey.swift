//
//  File.swift
//  
//
//  Created by Anderson  on 2024/2/15.
//

import FirebaseAnalytics
import Dependencies

extension AnalyticsClient: DependencyKey {
	public static let liveValue = AnalyticsClient(
		logEvent: { name, parameters in
			Analytics.logEvent(name, parameters: parameters)
		}
	)
}

public extension DependencyValues {
	var analytics: AnalyticsClient {
		get { self[AnalyticsClient.self] }
		set { self[AnalyticsClient.self] = newValue }
	}
}
