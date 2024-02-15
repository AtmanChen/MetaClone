//
//  File.swift
//  
//
//  Created by Anderson  on 2024/2/15.
//

import SwiftUI
import ComposableArchitecture
import FeedFeature
import VideoFeature
import FriendsFeature
import MarketPlaceFeature
import MenuFeature
import Colors

@Reducer
public struct RootNavigationLogic {
	public init() {}
	public enum Tab: Equatable {
		case feed
		case video
		case friends
		case marketPlace
		case menu
	}
	public struct State: Equatable {
		@BindingState var tabSelection = Tab.feed
		public init() {}
		var feed = FeedLogic.State()
		var video = VideoLogic.State()
		var friends = FriendsLogic.State()
		var marketPlace = MarketPlaceLogic.State()
		var menu = MenuLogic.State()
	}
	public enum Action: Equatable, BindableAction {
		case feed(FeedLogic.Action)
		case video(VideoLogic.Action)
		case friends(FriendsLogic.Action)
		case marketPlace(MarketPlaceLogic.Action)
		case menu(MenuLogic.Action)
		case binding(BindingAction<State>)
	}
	public var body: some ReducerOf<Self> {
		BindingReducer()
		Scope(state: \.feed, action: \.feed, child: FeedLogic.init)
		Scope(state: \.video, action: \.video, child: VideoLogic.init)
		Scope(state: \.friends, action: \.friends, child: FriendsLogic.init)
		Scope(state: \.marketPlace, action: \.marketPlace, child: MarketPlaceLogic.init)
		Scope(state: \.menu, action: \.menu, child: MenuLogic.init)
	}
}

public struct RootNavigationView: View {
	let store: StoreOf<RootNavigationLogic>
	public init(store: StoreOf<RootNavigationLogic>) {
		self.store = store
	}
	public var body: some View {
		WithViewStore(store, observe: { $0 }) { viewStore in
			TabView(selection: viewStore.$tabSelection) {
				FeedView(
					store: store.scope(
						state: \.feed,
						action: \.feed
					)
				)
				.tag(RootNavigationLogic.Tab.feed)
				.tabItem {
					Image(systemName: "house")
						.environment(\.symbolVariants, viewStore.tabSelection == .feed ? .fill : .none)
				}
				
				VideoView(
					store: store.scope(
						state: \.video,
						action: \.video
					)
				)
				.tag(RootNavigationLogic.Tab.video)
				.tabItem {
					Image(systemName: "play.tv")
						.environment(\.symbolVariants, viewStore.tabSelection == .video ? .fill : .none)
				}
				
				FriendsView(
					store: store.scope(
						state: \.friends,
						action: \.friends
					)
				)
				.tag(RootNavigationLogic.Tab.friends)
				.tabItem {
					Image(systemName: "person.2")
						.environment(\.symbolVariants, viewStore.tabSelection == .friends ? .fill : .none)
				}
				
				MarketPlaceView(
					store: store.scope(
						state: \.marketPlace,
						action: \.marketPlace
					)
				)
				.tag(RootNavigationLogic.Tab.marketPlace)
				.tabItem {
					Image(ImageResource.marketplace)
						.environment(\.symbolVariants, viewStore.tabSelection == .marketPlace ? .fill : .none)
				}
				
				MenuView(
					store: store.scope(
						state: \.menu,
						action: \.menu
					)
				)
				.tag(RootNavigationLogic.Tab.menu)
				.tabItem {
					Image(systemName: "text.justify")
						.environment(\.symbolVariants, viewStore.tabSelection == .menu ? .fill : .none)
				}
			}
		}
	}
}
