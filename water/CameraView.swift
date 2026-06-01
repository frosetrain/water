import SwiftUI

struct CameraView: View {
    @Binding var drinks: [DayDrinks]
    @Binding var image: Image?

    @State private var newImage: Image?

    var body: some View {
        NavigationStack {
            ZStack {
                if let newImage {
                    newImage
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(minWidth: 0, minHeight: 0)
                        .aspectRatio(3 / 4, contentMode: .fit)
                        .clipShape(.rect(cornerRadius: 8))
                        .shadow(radius: 8)
                        .padding()
                } else {
                    if let image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 500, height: 1000)
                            .clipped()

                        Button {
                            newImage = image
                        } label: {
                            Circle()
                                .fill(Color.gray.opacity(0.5))
                                .stroke(Color.white, lineWidth: 4)
                                .frame(width: 80, height: 80)
                        }
                        .offset(y: 300)
                    }
                }

                Spacer()

            }
            .navigationTitle("Drink")
            .toolbar {
                if let newImage {
                    ToolbarItem(placement: .confirmationAction) {
                        Button {
                            drinks[0].photos.append(Photo(photo: newImage))
                        } label: {
                            Image(systemName: "checkmark")
                        }
                        .buttonStyle(.glassProminent)
                        .tint(Color.blue)
                    }
                }
            }
            .ignoresSafeArea()
        }

    }

}

#Preview {
    ContentView()
}
