//
//  MetaCloneApp.swift
//  MetaClone
//
//  Created by anderson on 2024/1/14.
//

import SwiftUI
import ComposableArchitecture
import AppFeature
import AnalyticsClient


final class AppDelegate: NSObject, UIApplicationDelegate {
	static let shared = AppDelegate()
	let store = Store(
		initialState: AppLogic.State(),
		reducer: {
			AppLogic()
				._printChanges()
				.transformDependency(\.self) { dependency in
					dependency.analytics = .consoleLogger
				}
		}
	)
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
		store.send(.appDelegate(.didFinishLaunching))
		return true
	}
}

@main
struct MetaApp: App {
	@UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
	var body: some Scene {
		WindowGroup {
			AppView(
				store: appDelegate.store
			)
		}
	}
}
