//
//  File.swift
//  
//
//  Created by Anderson  on 2024/2/15.
//

import ComposableArchitecture
import OnboardFeature
import LaunchFeature
import NavigationFeature
import SwiftUI

@Reducer
public struct AppLogic {
	public init() {}
	
	public struct State: Equatable {
		var appDelegate = AppDelegateLogic.State()
		var view: View.State
		public init() {
			view = View.State.navigation()
		}
	}
	public enum Action: Equatable {
		case appDelegate(AppDelegateLogic.Action)
		case view(View.Action)
	}
	
	public var body: some ReducerOf<Self> {
		core
	}
	
	@ReducerBuilder<State, Action>
	private var core: some ReducerOf<Self> {
		Scope(state: \.appDelegate, action: \.appDelegate, child: AppDelegateLogic.init)
		Scope(state: \.view, action: \.view, child: View.init)
	}
	
	@Reducer
	public struct View {
		@ObservableState
		public enum State: Equatable {
			case launch(LaunchLogic.State = .init())
			case onboard(OnboardLogic.State = .init())
			case navigation(RootNavigationLogic.State = .init())
		}
		public enum Action: Equatable {
			case launch(LaunchLogic.Action)
			case onboard(OnboardLogic.Action)
			case navigation(RootNavigationLogic.Action)
		}
		public var body: some ReducerOf<View> {
			Scope(state: \.launch, action: \.launch, child: LaunchLogic.init)
			Scope(state: \.onboard, action: \.onboard, child: OnboardLogic.init)
			Scope(state: \.navigation, action: \.navigation, child: RootNavigationLogic.init)
		}
	}
}

public struct AppView: View {
	let store: StoreOf<AppLogic>
	public init(store: StoreOf<AppLogic>) {
		self.store = store
	}
	public var body: some View {
		SwitchStore(
			store.scope(state: \.view, action: \.view)
		) { initialState in
			switch initialState {
			case .launch:
				CaseLet(
					/AppLogic.View.State.launch,
					 action: AppLogic.View.Action.launch,
					 then: LaunchView.init(store:)
				)
			case .onboard:
				CaseLet(
					/AppLogic.View.State.onboard,
					action: AppLogic.View.Action.onboard,
					then: OnboardView.init(store:)
				)
				
			case .navigation:
				CaseLet(
					/AppLogic.View.State.navigation,
					 action: AppLogic.View.Action.navigation,
					 then: RootNavigationView.init(store:)
				)
			}
		}
	}
}

