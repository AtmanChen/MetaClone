// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Deps",
		defaultLocalization: "en",
		platforms: [
			.iOS(.v16)
		],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AnalyticsClient",
            targets: ["AnalyticsClient"]),
    ],
		dependencies: [
			.package(url: "https://github.com/pointfreeco/swift-composable-architecture", exact: "1.8.0"),
			.package(url: "https://github.com/firebase/firebase-ios-sdk", from: "10.16.0")
		],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
					name: "AnalyticsClient",
					dependencies: [
						.product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
						.product(name: "FirebaseAnalytics", package: "firebase-ios-sdk")
					]
				),
    ]
)
