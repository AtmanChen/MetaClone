//
//  File.swift
//  
//
//  Created by Anderson  on 2024/2/15.
//

import ComposableArchitecture
import AnalyticsClient
import UIKit

@Reducer
public struct AppDelegateLogic {
	public struct State: Equatable {}
	public enum Action: Equatable {
		case didFinishLaunching
		case didReceiveRemoteNotification([AnyHashable: Any])
		case didRegisterForRemoteNotifications(TaskResult<Data>)
//		case userNotifications(UserNotificationClient.DelegateEvent)
//		case messaging(FirebaseMessagingClient.DelegateAction)
		case configurationForConnecting(UIApplicationShortcutItem?)
		case dynamicLink(URL?)
		case delegate(Delegate)
		
		public enum Delegate: Equatable {
			case didFinishLaunching
		}
		public static func ==(lhs: AppDelegateLogic.Action, rhs: AppDelegateLogic.Action) -> Bool {
			switch (lhs, rhs) {
			case (.didReceiveRemoteNotification, .didReceiveRemoteNotification):
				return false
			default:
				return lhs == rhs
			}
		}
	}
	
	@Dependency(\.analytics) var analytics
	
	public func reduce(into state: inout State, action: Action) -> Effect<Action> {
		switch action {
		case .didFinishLaunching:
			return .run { @MainActor send in
				// firebase config
//				firebaseCore.configure()
				await withThrowingTaskGroup(of: Void.self) { group in
//					group.addTask {
//						guard try await userNotifications.requestAuthorization([.alert, .sound, .badge])
//						else { return }
//						await registerForRemoteNotifications()
//					}
//					group.addTask {
//						for await event in userNotifications.delegate() {
//							await send(.userNotifications(event))
//						}
//					}
//					group.addTask {
//						for await event in firebaseMessaging.delegate() {
//							await send(.messaging(event))
//						}
//					}
					group.addTask {
						await send(.delegate(.didFinishLaunching))
					}
				}
			}
//		case .didReceiveRemoteNotification(let dictionary):
//		case .didRegisterForRemoteNotifications(let taskResult):
//		case .configurationForConnecting(let uIApplicationShortcutItem):
//		case .dynamicLink(let uRL):
//		case .delegate(let delegate):
		default: return .none
			
		}
	}
}
