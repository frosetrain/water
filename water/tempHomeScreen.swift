//
//  tempHomeScreen.swift
//  water
//
//  Created by Gabriel on 1/6/26.
//

import SwiftUI

struct tempHomeScreen: View {
    @Binding var drinks: [DayDrinks]
    @Binding var image: Image?
    
    var body: some View {
        NavigationStack {
           
            
            
            
            NavigationLink(destination: CameraView(drinks: $drinks, image: $image)) {
                Label ("Camera", systemImage: "camera")
            }
        }
        
    }
}
