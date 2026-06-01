//
//  SlantedView.swift
//  water
//
//  Created by T Krobot on 30/5/26.
//

import SwiftUI

struct SlantedView: View {
    @Binding var drinks: [DayDrinks]

    var body: some View {
        NavigationStack {
            List {
                ForEach(drinks, id: \.self) { value in
                    VStack(alignment: .leading) {
                        Text(formatDate(date: value.date))
                            .bold()
                        ScrollView(.horizontal) {
                            HStack(spacing: -8) {
                                ForEach(value.photos, id: \.self) { img in
                                    img.photo
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 50, height: 50)
                                        .aspectRatio(1, contentMode: .fit)
                                        .clipShape(.rect(cornerRadius: 8))
                                        .shadow(radius: 3)
                                        .rotationEffect(Angle(degrees: 7))
                                }
                            }
                            .padding(7)
                        }
                    }
                }
            }
            .navigationTitle("Gallery")
        }
    }
}

//#Preview {
//    SlantedView()
//}
