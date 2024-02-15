// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Features",
		defaultLocalization: "en",
		platforms: [
			.iOS(.v15)
		],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AppFeature",
            targets: ["AppFeature"]),
				.library(name: "LaunchFeature", targets: ["LaunchFeature"]),
				.library(name: "OnboardFeature", targets: ["OnboardFeature"]),
				.library(name: "NavigationFeature", targets: ["NavigationFeature"]),
				.library(name: "FeedFeature", targets: ["FeedFeature"]),
				.library(name: "VideoFeature", targets: ["VideoFeature"]),
				.library(name: "FriendsFeature", targets: ["FriendsFeature"]),
				.library(name: "MarketPlaceFeature", targets: ["MarketPlaceFeature"]),
				.library(name: "MenuFeature", targets: ["MenuFeature"]),
    ],
		dependencies: [
			.package(path: "../UIComponents"),
			.package(path: "../Deps"),
			.package(url: "https://github.com/onevcat/Kingfisher", from: "7.9.1"),
			.package(url: "https://github.com/edonv/SwiftUIMessage", from: "0.0.3"),
			.package(url: "https://github.com/pointfreeco/swift-composable-architecture", exact: "1.8.0"),
			.package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.1.0")
		],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
					name: "AppFeature",
					dependencies: [
						"OnboardFeature",
						"LaunchFeature",
						"NavigationFeature",
						.product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
						.product(name: "AnalyticsClient", package: "Deps")
					]
				),
				.target(
					name: "LaunchFeature",
					dependencies: [
						.product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
						.product(name: "Colors", package: "UIComponents"),
					]
				),
				.target(
					name: "OnboardFeature",
					dependencies: [
						.product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
						.product(name: "Colors", package: "UIComponents"),
						.product(name: "AnalyticsClient", package: "Deps"),
					]
				),
				.target(
					name: "NavigationFeature",
					dependencies: [
						"VideoFeature",
						"FeedFeature",
						"FriendsFeature",
						"MarketPlaceFeature",
						"MenuFeature",
						.product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
					]
				),
				.target(
					name: "FeedFeature",
					dependencies: [
						.product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
						.product(name: "AnalyticsClient", package: "Deps"),
					]
				),
				.target(
					name: "VideoFeature",
					dependencies: [
						.product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
						.product(name: "AnalyticsClient", package: "Deps"),
					]
				),
				.target(
					name: "FriendsFeature",
					dependencies: [
						.product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
						.product(name: "AnalyticsClient", package: "Deps"),
					]
				),
				.target(
					name: "MarketPlaceFeature",
					dependencies: [
						.product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
						.product(name: "AnalyticsClient", package: "Deps"),
					]
				),
				.target(
					name: "MenuFeature",
					dependencies: [
						.product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
						.product(name: "AnalyticsClient", package: "Deps"),
					]
				)
    ]
)
