//
//  GriddyView.swift
//  water
//
//  Created by T Krobot on 30/5/26.
//

import SwiftUI

struct GriddyView: View {
    @Binding var drinks: [DayDrinks]

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {
        NavigationStack {
            List {
                ForEach(drinks, id: \.self) { value in
                    VStack(alignment: .leading, spacing: 16) {
                        Text(formatDate(date: value.date))
                            .bold()
                        LazyVGrid(columns: columns) {
                            ForEach(value.photos, id: \.self) { img in
                                img.photo
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(minWidth: 0, minHeight: 0)
                                    .aspectRatio(1, contentMode: .fit)
                                    .clipShape(.rect(cornerRadius: 8))
                                    .shadow(radius: 3)
                                    .rotationEffect(Angle(degrees: 7))
                            }
                        }
                    }
                }
            }
            .navigationTitle("Gallery")
        }
    }
}

//#Preview {
//    GriddyView()
//}
