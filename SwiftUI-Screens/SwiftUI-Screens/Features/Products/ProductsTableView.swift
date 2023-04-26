//
//  ProductsTableView.swift
//  SwiftUI-Screens
//
//  Created by Glenn Ludszuweit on 21/04/2023.
//

import SwiftUI

struct ProductsTableView: View {
    let section2Data = ["Item A", "Item B", "Item C"]
    
    var body: some View {
        List {
            Section(header: Text("")) {
                ForEach(1...20, id: \.self) { item in
                    NavigationLink("\(item)") {
                        ProductDetailsView(text: "\(item)")
                    }
                }
            }
            Section(header: Text("")) {
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
