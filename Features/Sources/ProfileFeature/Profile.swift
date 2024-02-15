//
//  File.swift
//  
//
//  Created by Anderson  on 2024/2/15.
//

import SwiftUI
import ComposableArchitecture

@Reducer
public struct ProfileLogic {
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

public struct ProfileView: View {
	let store: StoreOf<ProfileLogic>
	public init(store: StoreOf<ProfileLogic>) {
		self.store = store
	}
	public var body: some View {
		Text("Profile")
	}
}
