//
//  ProductsTableView.swift
//  SwiftUI-Screens
//
//  Created by Glenn Ludszuweit on 21/04/2023.
//

import SwiftUI

struct ProductsTableView: View {
    let section1Data = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
    let section2Data = ["Item A", "Item B", "Item C"]
    
    var body: some View {
        List {
            Section(header: Text("Section 1")) {
                ForEach(section1Data, id: \.self) { item in
                    NavigationLink("\(item)") {
                        ProductDetailsView(text: "\(item)")
                    }
                }
            }
            Section(header: Text("Section 2")) {
                ForEach(section2Data, id: \.self) { item in
                    Text(item)
                }
            }
        }
    }
}

struct ProductsTableView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsTableView()
    }
}
