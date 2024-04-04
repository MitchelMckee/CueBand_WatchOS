import SwiftUI

struct StartView: View {
    @EnvironmentObject var navigationCoordinator: NavigationCoordinator
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Button("Start") {
                            navigationCoordinator.navigate(to: .cuesPerMinute)
                        }
                .buttonStyle(CustomButtonStyle(color: .black, textColor: .white))
            }
            .padding()
            .background(Color.white)
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView().environmentObject(NavigationCoordinator())
    }
}
