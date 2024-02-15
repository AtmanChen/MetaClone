//
//  File.swift
//  
//
//  Created by Anderson  on 2024/2/15.
//

import SwiftUI

public struct DividerView: View {
	private let width: CGFloat
	public init(width: CGFloat) {
		self.width = width
	}
	public var body: some View {
		Rectangle()
			.foregroundStyle(Color(.systemGray6))
			.frame(width: width, height: 6)
	}
}
