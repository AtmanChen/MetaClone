//
//  File.swift
//  
//
//  Created by Anderson  on 2024/2/15.
//

import SwiftUI
import ComposableArchitecture

@Reducer
public struct FriendsLogic {
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

public struct FriendsView: View {
	let store: StoreOf<FriendsLogic>
	public init(store: StoreOf<FriendsLogic>) {
		self.store = store
	}
	public var body: some View {
		/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
	}
}
