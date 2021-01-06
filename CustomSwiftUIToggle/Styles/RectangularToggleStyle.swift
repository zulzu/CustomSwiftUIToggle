
import SwiftUI

/// A toggle style that specifies the appearence of a toggle.
public struct RectangularToggleStyle: ToggleStyle {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    /// The width of the toggle's outer shape
    let toggleWidth: CGFloat
    
    // # Private/Fileprivate
    /// The height of the toggle's bounding box is determined by multiplying the toggleWidth parameter by this value
    private let heightMultiplier: CGFloat = 0.5
    
    //=======================================
    // MARK: Public Methods
    //=======================================
    //------------------------------------
    // MARK: Initilisers
    //------------------------------------
    /// Initilise an instance
    /// - Parameter width: The width of the toggle's outer shape
    public init(width: CGFloat = 60) {
        self.toggleWidth = width
    }
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        
        HStack {
            
            configuration.label
            
            ZStack(alignment: configuration.isOn ? .trailing : .leading) {
                
                // The frame of the toggle
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: toggleWidth, height: toggleWidth * heightMultiplier)
                    .foregroundColor(.clear)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(configuration.isOn ? Color.green : Color.red, lineWidth: 1)
                    )
                
                // The on/off part of the toggle
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: (toggleWidth * heightMultiplier) - 5, height: toggleWidth * heightMultiplier - 5)
                    .padding(4)
                    .foregroundColor(configuration.isOn ? .green : .red)
                    .offset(x: configuration.isOn ? 1 : -1)
            }
            .onTapGesture {
                withAnimation {
                    configuration.$isOn.wrappedValue.toggle()
                }
            }
        }
    }
    
    //=======================================
    // MARK: Private Methods
    //=======================================
}


//=======================================
// MARK: Previews
//=======================================
struct RectangularToggleStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Toggle("Toggle test 1", isOn: Binding.constant(true))
                .toggleStyle(RectangularToggleStyle())
            Toggle("Toggle test 2", isOn: Binding.constant(false))
                .toggleStyle(RectangularToggleStyle())
        }
        .padding()
    }
}
