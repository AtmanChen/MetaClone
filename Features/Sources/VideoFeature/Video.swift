//
//  File.swift
//  
//
//  Created by Anderson  on 2024/2/15.
//

import SwiftUI
import ComposableArchitecture

@Reducer
public struct VideoLogic {
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

public struct VideoView: View {
	let store: StoreOf<VideoLogic>
	public init(store: StoreOf<VideoLogic>) {
		self.store = store
	}
	public var body: some View {
		/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
	}
}
