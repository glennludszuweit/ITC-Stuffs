//
//  SwiftUIView.swift
//  Nav-SwiftUI-UIkit
//
//  Created by Glenn Ludszuweit on 26/04/2023.
//

import SwiftUI

struct SwiftUIView: View {
    weak var navigationController: UINavigationController?
    var body: some View {
        VStack {
            Group {
                Button {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let secondViewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
                    navigationController?.pushViewController(secondViewController, animated: true)
                } label: {
                    Text("UIKit").frame(maxWidth: .infinity)
                }.tint(.purple)
                    .padding(.top, 25)
                
                NavigationLink {
                    GeometryReaderView()
                } label: {
                    Text("Geometry Reader").frame(maxWidth: .infinity)
                }.tint(.mint)
                
            }.buttonStyle(.borderedProminent)
                .padding(10)
            
            Spacer()
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
