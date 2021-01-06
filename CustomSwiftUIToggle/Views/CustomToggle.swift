
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

    // # Private/Fileprivate
    
    // # Body
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                
                Text(title)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.leading)
                Spacer()
                Toggle("", isOn: $isOn)
                    .toggleStyle(RectangularToggleStyle())
            }
        }
    }
    
    //=======================================
    // MARK: Public Methods
    //=======================================
    
    //=======================================
    // MARK: Private Methods
    //=======================================
}


//=======================================
// MARK: Previews
//=======================================
struct CustomToggle_Previews: PreviewProvider {
    static var previews: some View {
        CustomToggle(title: "Toggle title", isOn: Binding.constant(true))
    }
}
