//
//  ProductDetailsView.swift
//  SwiftUI-Screens
//
//  Created by Glenn Ludszuweit on 21/04/2023.
//

import SwiftUI

struct ProductDetailsView: View {
    @State var text: String = ""
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: "https://images.pexels.com/photos/3377405/pexels-photo-3377405.jpeg?cs=srgb&dl=pexels-el%C4%ABna-ar%C4%81ja-3377405.jpg&fm=jpg"))
            Text(text).foregroundColor(.white).fontWeight(.bold)
        }
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView()
    }
}
