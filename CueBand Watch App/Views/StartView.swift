import SwiftUI

struct StartView: View {
    @EnvironmentObject var navigationCoordinator: NavigationCoordinator
   
    
    var body: some View {
        
        let screen_bounds = WKInterfaceDevice.current().screenBounds
        let max_button_width = screen_bounds.width * 0.9
        
              VStack(spacing: 20) {
                  Spacer()
                  Button("Start") {
                      navigationCoordinator.navigate(to: .cuesPerMinute)
                  }
                  .buttonStyle(CustomButtonStyle(color: .black, textColor: .white, width: max_button_width, height: 80, radius: 20))
                  .font(.title)
                  .bold()
                  
                  
                  Button("Schedule") {
                      navigationCoordinator.navigate(to: .scheduleTimeOfDay)
                  }
                  .buttonStyle(CustomButtonStyle(color: .black, textColor: .white, width: max_button_width * 0.8, height: 60, radius: 20))
                  .font(.title3)
                  .bold()
                  
                  Spacer()
              }
              .padding()
              .frame(maxWidth: .infinity, maxHeight: .infinity)
              .edgesIgnoringSafeArea(.all)
              .background(Color.white)
          }
      }

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView().environmentObject(NavigationCoordinator())
    }
}
