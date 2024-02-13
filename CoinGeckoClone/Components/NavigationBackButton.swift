//
//  NavigationBackButton.swift
//  CoinGeckoClone
//
//  Created by Benjamin Ott on 13.02.24.
//

import SwiftUI

struct NavigationBackButton: View {
    
    var label: String
    
    var body: some View {
        Button(action: {
              
           }) {
               Image(systemName: "arrow.left")
                   .foregroundColor(.black)
                   .imageScale(.large)
                   .frame(width: 44, height: 44)
                   .padding(.leading, 16)
           }
       }
   }

struct NavigationBackButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBackButton(label: "Back")
    }
}
