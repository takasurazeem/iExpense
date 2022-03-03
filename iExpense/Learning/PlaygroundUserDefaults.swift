//  *Sarcasm*
//  *PlaygroundUserDefaults*.swift
//  iExpense
//
//  Created by Takasur Azeem on 02/03/2022.
//

import SwiftUI

struct PlaygroundUserDefaults: View {
    
    @AppStorage("tapCount") private var tapCount = 0
    
    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1
        }
    }
}

struct PlaygroundUserDefaults_Previews: PreviewProvider {
    static var previews: some View {
        PlaygroundUserDefaults()
    }
}
