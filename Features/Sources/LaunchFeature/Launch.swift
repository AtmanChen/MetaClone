//
//  File.swift
//  
//
//  Created by Anderson  on 2024/2/15.
//

import ComposableArchitecture
import SwiftUI
import Colors

@Reducer
public struct LaunchLogic {
	public init() {}
	public struct State: Equatable {
		public init() {}
	}
	public enum Action: Equatable {
		case onTask
	}
	public var body: some ReducerOf<Self> {
		Reduce { _, action in
			switch action {
			case .onTask:
				return .none
			}
		}
	}
}

public struct LaunchView: View {
	let store: StoreOf<LaunchLogic>
	public init(store: StoreOf<LaunchLogic>) {
		self.store = store
	}
	public var body: some View {
		Color.godWhite
			.ignoresSafeArea()
	}
}

#Preview {
	LaunchView(
		store: Store(
			initialState: LaunchLogic.State(),
			reducer: LaunchLogic.init
		)
	)
}
