//
//  ContentView.swift
//  SwiftUi-Weather
//
//  Created by Omid Zaheri on 6/23/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false

    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight )
            VStack {
                CityTextView(cityName: "Tehran, IR")
                
                VStack(spacing: 8) {
                    MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                          temperature: 33)
                }
                
                .padding(.bottom, 40)
                
                HStack(spacing: 25){
                    WeatherDayView(daysOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperature: 35)
                    
                    WeatherDayView(daysOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temperature: 34)
                    
                    WeatherDayView(daysOfWeek: "THU",
                                   imageName: "sun.max.fill",
                                   temperature: 34)
                    
                    WeatherDayView(daysOfWeek: "FRI",
                                   imageName: "sun.max.fill",
                                   temperature: 36)
                    
                    WeatherDayView(daysOfWeek: "SAT",
                                   imageName: "wind.snow",
                                   temperature: 22 )
                }
                    Spacer()
                
                Button{
                    
                    isNight.toggle()
                    
                }label:{
                    WeatherButton(title: "Change Day Time",
                                  backgroundColor: .white,
                                  textColor: .blue)
                }
                
                
                
                Spacer()
            }
        }
    }
}
            

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var daysOfWeek: String
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack{
            Text(daysOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
        
//        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlu")]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//        .ignoresSafeArea()
    
    ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
        .ignoresSafeArea()
    
    }
}

struct CityTextView: View {
   
    var cityName: String
    
    var body: some View {
        Text(cityName )
            .font(.system(size: 32, weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding()
    }
    
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    
    var body: some View {
        Image(systemName: imageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180)
        
        Text("\(temperature )°")
            .font(.system(size: 70, weight: .medium))
            .foregroundColor(.white)
    }
}

