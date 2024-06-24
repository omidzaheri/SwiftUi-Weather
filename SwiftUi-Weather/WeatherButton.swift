//
//  WeatherButton.swift
//  SwiftUi-Weather
//
//  Created by Omid Zaheri on 6/24/24.
//

import SwiftUI

struct WeatherButton: View {
    
    var title: String
    var backgroundColor: Color
    var textColor: Color
    
    var body: some View {
            Text(title)
                .frame(width: 280, height: 50)
                .background(backgroundColor.gradient)
                .foregroundColor(textColor)
                .font(.system(size: 20, weight: .bold, design: .default))
                .cornerRadius(10)
    }
}

struct WeatherButton_Preview: PreviewProvider {
    static var previews: some View {
        WeatherButton(title: "Test Title",
                      backgroundColor: .blue,
                      textColor: .white)
    }
}
