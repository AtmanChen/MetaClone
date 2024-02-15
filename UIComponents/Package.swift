// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIComponents",
		defaultLocalization: "en",
		platforms: [
			.iOS(.v16)
		],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(name: "Colors", targets: ["Colors"]),
				.library(name: "ColorHex", targets: ["ColorHex"]),
				.library(name: "DividerView", targets: ["DividerView"]),
    ],
    targets: [
			.target(name: "ColorHex"),
			.target(name: "Colors", dependencies: ["ColorHex"]),
			.target(name: "DividerView"),
    ]
)
