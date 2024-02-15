//
//  File.swift
//  
//
//  Created by Anderson  on 2024/2/15.
//

import SwiftUI
import ComposableArchitecture

@Reducer
public struct MarketPlaceLogic {
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

public struct MarketPlaceView: View {
	let store: StoreOf<MarketPlaceLogic>
	public init(store: StoreOf<MarketPlaceLogic>) {
		self.store = store
	}
	public var body: some View {
		/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
	}
}
