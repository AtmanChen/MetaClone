//
//  File.swift
//  
//
//  Created by Anderson  on 2024/2/15.
//

import SwiftUI
import ComposableArchitecture
import Colors
import ProfileFeature
import DividerView

@Reducer
public struct FeedLogic {
	public init() {}
	
	public struct State: Equatable {
		var path = StackState<Path.State>()
		public init() {}
	}
	public enum Action {
		case didTapAvatar
		case didTapWhatsOnYourMind
		case path(StackAction<Path.State, Path.Action>)
	}
	public var body: some ReducerOf<Self> {
		Reduce { state, action in
			switch action {
			case .didTapAvatar:
				state.path.append(.profile(ProfileLogic.State()))
				return .none
			case .didTapWhatsOnYourMind:
				return .none
			default:
				return .none
			}
		}
		.forEach(\.path, action: \.path) {
			Path()
		}
	}
	
	@Reducer
	public struct Path {
		public enum State: Equatable {
			case profile(ProfileLogic.State)
		}
		public enum Action: Equatable {
			case profile(ProfileLogic.Action)
		}
		public var body: some ReducerOf<Self> {
			Scope(state: \.profile, action: \.profile, child: ProfileLogic.init)
		}
	}
}

public struct FeedView: View {
	let store: StoreOf<FeedLogic>
	public init(store: StoreOf<FeedLogic>) {
		self.store = store
	}
	public var body: some View {
		WithViewStore(store, observe: { $0 }) { viewStore in
			NavigationStackStore(store.scope(state: \.path, action: \.path)) {
				feedMainView
			} destination: { store in
				SwitchStore(store) { initialState in
					switch initialState {
					case let .profile(state):
						ProfileView(
							store: Store(
								initialState: state,
								reducer: ProfileLogic.init
							)
						)
					}
				}
			}
		}
	}
	
	// MARK: - FeedMainView
	@ViewBuilder
	private var feedMainView: some View {
		GeometryReader { proxy in
			VStack {
				HeaderView
				DividerView(width: proxy.size.width)
				ScrollFeedView
				DividerView(width: proxy.size.width)
				Spacer()
			}
			.toolbar {
				ToolbarItem(placement: .topBarLeading) {
					Text("Meta")
						.font(.system(size: 32, weight: .bold))
						.foregroundStyle(Color.godBlue)
				}
				ToolbarItem(placement: .topBarTrailing) {
					HStack(spacing: 24) {
						Image(systemName: "plus.circle.fill")
							.resizable()
							.scaledToFill()
							.frame(width: 24, height: 24)
						Image(systemName: "magnifyingglass")
							.resizable()
							.scaledToFill()
							.frame(width: 24, height: 24)
							.font(.system(size: 18, weight: .bold))
						Image(ImageResource.messenger)
							.resizable()
							.scaledToFill()
							.frame(width: 24, height: 24)
					}
				}
			}
		}
	}
	
	// MARK: - HeaderView
	@ViewBuilder
	private var HeaderView: some View {
		HStack {
			Button {
				store.send(.didTapAvatar)
			} label: {
				Image(ImageResource.profilePic)
					.resizable()
					.scaledToFill()
					.frame(width: 40, height: 40)
					.clipShape(Circle())
			}
			
			Button {
				store.send(.didTapWhatsOnYourMind)
			} label: {
				HStack {
					Text("What's on your mind?")
					Spacer()
				}
				.padding(.horizontal)
				.padding(.vertical, 10)
				.overlay {
					Capsule()
						.stroke(Color(.systemGray4), lineWidth: 1.0)
				}
				.padding(.leading, 6)
				.padding(.trailing, 16)
			}
			.buttonStyle(.plain)
			.foregroundStyle(.primary)
			
			Image(systemName: "photo.on.rectangle.angled")
				.resizable()
				.scaledToFill()
				.frame(width: 24, height: 24)
				.foregroundStyle(Color.godGreen)
		}
		.padding(.horizontal)
		.padding(.top, 30)
		.padding(.bottom)
	}
	
	@ViewBuilder
	private var ScrollFeedView: some View {
		ScrollView(.horizontal) {
			HStack {
				MyStoryCardView
				StoryCardView
			}
		}
		.scrollIndicators(.hidden)
		.padding(.vertical, 6)
	}
	
	// MARK: - MyStoryCardView
	@ViewBuilder
	private var MyStoryCardView: some View {
		ZStack(alignment: .top) {
			RoundedRectangle(cornerRadius: 15)
				.foregroundStyle(Color(.systemGray6))
				.frame(width: 100, height: 170)
			Image(ImageResource.profilePic)
				.resizable()
				.scaledToFill()
				.frame(width: 100, height: 110)
				.clipShape(
					UnevenRoundedRectangle(
						cornerRadii: RectangleCornerRadii(
							topLeading: 15,
							topTrailing: 15
						)
					)
				)
			VStack(spacing: 2) {
				Spacer()
					.frame(height: 90)
				Image(systemName: "plus")
					.padding(6)
					.background(.blue)
					.clipShape(Circle())
					.foregroundStyle(Color(.systemBackground))
					.font(.system(size: 20, weight: .bold))
					.overlay {
						Circle()
							.stroke(Color(.systemGray6), lineWidth: 3)
					}
				VStack(spacing: 0) {
					Text("Create")
					Text("Story")
				}
				.font(.system(size: 12, weight: .bold))
			}
		}
		.padding(.leading)
	}
	
	@ViewBuilder
	private var StoryCardView: some View {
		Image(ImageResource.story1)
			.resizable()
			.scaledToFill()
			.frame(width: 100, height: 170)
			.clipShape(
				RoundedRectangle(
					cornerRadius: 15
				)
			)
			.overlay {
				VStack(alignment: .leading) {
					Image(ImageResource.profilePic1)
						.resizable()
						.scaledToFill()
						.frame(width: 36, height: 36)
						.clipShape(Circle())
						.overlay {
							Circle()
								.stroke(Color.godBlue, lineWidth: 3)
						}
					Spacer()
					HStack {
						Text("Jim Halpert")
							.foregroundStyle(.white)
							.font(.system(size: 12, weight: .semibold))
						Spacer()
					}
				}
				.padding(.leading, 8)
				.padding(.vertical, 8)
			}
	}
	
}

#Preview {
	FeedView(
		store: Store(
			initialState: FeedLogic.State(),
			reducer: FeedLogic.init
		)
	)
}

