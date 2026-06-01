import SwiftUI

struct CameraView: View {
    @Binding var drinks: [DayDrinks]
    @Binding var image: Image?

    @State private var newImage: Image?
    var body: some View {
        NavigationStack {
            ZStack {
                if let image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 500, height: 1000)
                        .clipped()
                }
                if let newImage {
                    newImage
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 70, height: 70)
                        .clipped()
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 20,
                                style: .continuous
                            )
                        )
                        .offset(x: 130, y: 300)
                }

                Spacer()

                VStack {
                    Button(action: {
                        newImage = image
                        drinks[0].photos.append(Photo(photo: newImage!))
                    }) {
                        Circle()
                            .fill(Color.gray.opacity(0.5))
                            .stroke(Color.white, lineWidth: 4)
                            .frame(width: 80, height: 80)
                    }
                    .offset(y: 300)
                }

                Button {
                    print("Why did you click me?")
                } label: {
                    Text("Submit Photo")
                }
                .buttonStyle(.glass)
                .tint(Color.blue)
                .offset(x: 130, y: -360)
            }
            .navigationTitle("Drink")
            .ignoresSafeArea()
        }

    }

}

#Preview {
    ContentView()
}
