//
//  ContentView.swift
//  water
//
//  Created by T Krobot on 30/5/26.
//

import SwiftUI

let isoFormatter = ISO8601DateFormatter()

struct Photo: Identifiable, Hashable {
    let id = UUID()
    let photo: Image
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct DayDrinks: Hashable {
    let id = UUID()
    var photos: [Photo] = []
    let date: Date
}

func formatDate(date: Date) -> String {
    let calendar = Calendar.current
    
    if calendar.isDateInToday(date) { return "Today" }
    if calendar.isDateInYesterday(date) { return "Yesterday" }
    
    return date.formatted(date: .complete, time: .omitted)
    
}

struct ContentView: View {
    @State private var drinks = [
        DayDrinks(
            photos: [],
            date: isoFormatter.date(from: "2026-06-01T12:00:00Z")!
        ),
        DayDrinks(
            photos: [
                Photo(photo: Image(.redLight)),
                Photo(photo: Image(.orangeLight)),
                Photo(photo: Image(.yellowLight)),
                Photo(photo: Image(.greenLight)),
                Photo(photo: Image(.skyblueLight)),
                Photo(photo: Image(.blueLight)),
                Photo(photo: Image(.silverLight)),
            ],
            date: isoFormatter.date(from: "2026-05-31T12:00:00Z")!
        ),
        DayDrinks(
            photos: [
                Photo(photo: Image(.blueLight)),
                Photo(photo: Image(.skyblueLight)),
            ],
            date: isoFormatter.date(from: "2026-05-30T12:00:00Z")!
        ),
        DayDrinks(
            photos: [
                Photo(photo: Image(.orangeLight)),
                Photo(photo: Image(.redLight)),
            ],
            date: isoFormatter.date(from: "1000-10-10T12:00:00Z")!
        ),
    ]
    
    var body: some View {
        TabView {
            Tab("Griddy", systemImage: "square.grid.3x2") {
                GriddyView(drinks: $drinks)
            }
            
            Tab("Slanted", systemImage: "menucard") {
                SlantedView(drinks: $drinks)
            }
            
            Tab("Camera", systemImage: "camera") {
                CameraView(drinks: $drinks)
            }
        }
    }
}

#Preview {
    ContentView()
}
