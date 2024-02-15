//
//  File.swift
//  
//
//  Created by Anderson  on 2024/2/15.
//

import SwiftUI
import ComposableArchitecture
import Colors

@Reducer
public struct OnboardLogic {
	public init() {}
	public struct State: Equatable {
		public init() {}
	}
	public enum Action: Equatable {
		
	}
	public var body: some ReducerOf<Self> {
		Reduce { state, action in
			switch action {
				
			}
		}
	}
}

public struct OnboardView: View {
	let store: StoreOf<OnboardLogic>
	public init(store: StoreOf<OnboardLogic>) {
		self.store = store
	}
	public var body: some View {
		Text("Welcome!")
	}
}
