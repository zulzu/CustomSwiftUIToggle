
import SwiftUI

/// Creates a toggle that displays a custom label.
struct CustomToggle: View {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    // The title of the toggle
    let title: String
    // The state of the toggle
    @Binding var isOn: Bool
    // The width of the toggle's outer shape
    let toggleWidth: CGFloat

    // # Private/Fileprivate
    
    // # Body
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                
                Text(title)
                    .font(Font.custom("Helvetica Light", size: 24))
                    .fontWeight(.regular)
                    .multilineTextAlignment(.leading)
                Spacer()
                Toggle("", isOn: $isOn)
                    .toggleStyle(RectangularToggleStyle(width: toggleWidth))
            }
        }
    }
    
    //------------------------------------
    // MARK: Initilisers
    //------------------------------------
    /// Creates a toggle that displays a custom label.
    /// - Parameters:
    ///   - title: The title of the toggle
    ///   - isOn: The state of the toggle
    ///   - toggleWidth: The width of the toggle's outer shape
    public init(title: String, isOn: Binding<Bool>, toggleWidth: CGFloat) {
        self.title = title
        self._isOn = isOn
        self.toggleWidth = toggleWidth
    }
}


//=======================================
// MARK: Previews
//=======================================
struct CustomToggle_Previews: PreviewProvider {
    static var previews: some View {
        CustomToggle(title: "Toggle title", isOn: Binding.constant(true), toggleWidth: 60)
    }
}
