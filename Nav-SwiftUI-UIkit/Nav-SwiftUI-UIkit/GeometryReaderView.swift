//
//  GeometryReaderView.swift
//  Nav-SwiftUI-UIkit
//
//  Created by Glenn Ludszuweit on 26/04/2023.
//

import SwiftUI

struct GeometryReaderView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Text("Width: \(geometry.size.width), Height: \(geometry.size.height)")
                        .frame(width: geometry.size.width/2, height: geometry.size.height/2)
                        .background(.purple)
                    Text("Width: \(geometry.size.width), Height: \(geometry.size.height)")
                        .frame(width: geometry.size.width/2, height: geometry.size.height/2)
                        .background(.mint)
                }
                HStack {
                    Text("Width: \(geometry.size.width), Height: \(geometry.size.height)")
                        .frame(width: geometry.size.width/2, height: geometry.size.height/2)
                        .background(.orange)
                    Text("Width: \(geometry.size.width), Height: \(geometry.size.height)")
                        .frame(width: geometry.size.width/2, height: geometry.size.height/2)
                        .background(.red)
                }
            }
        }
    }
}

struct GeometryReaderView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderView()
    }
}
