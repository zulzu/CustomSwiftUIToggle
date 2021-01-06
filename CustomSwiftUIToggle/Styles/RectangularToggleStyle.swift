
import SwiftUI

public struct RectangularToggleStyle: ToggleStyle {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    let toggleWidth: CGFloat
    
    // # Private/Fileprivate
    private let heightMultiplier: CGFloat = 0.5
    
    //=======================================
    // MARK: Public Methods
    //=======================================
    //------------------------------------
    // MARK: Initilisers
    //------------------------------------
    public init(width: CGFloat = 60) {
        self.toggleWidth = width
    }
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        
        HStack {
            
            configuration.label
            
            ZStack(alignment: configuration.isOn ? .trailing : .leading) {
                
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: toggleWidth, height: toggleWidth * heightMultiplier)
                    .foregroundColor(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(configuration.isOn ? Color.green : Color.red, lineWidth: 1)
                    )
                
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
