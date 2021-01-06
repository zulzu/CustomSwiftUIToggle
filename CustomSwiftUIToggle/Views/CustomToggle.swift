
import SwiftUI

struct CustomToggle: View {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    let title: String
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
