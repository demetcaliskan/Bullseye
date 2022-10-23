//
//  ContentView.swift
//  Bullseye
//
//  Created by Demet Çalışkan on 18.10.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionsView(game: $game)
                SliderView(value: $sliderValue).padding()
                HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                
            }
        }
    }
}

struct InstructionsView: View {
    @Binding var game: Game
    var body: some View {
        VStack {
            InstructionText(text: "🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                .padding(.leading, 30.0)
                .padding(.trailing, 30.0)
            BigNumberText(number: game.target)
        }
    }
}

struct SliderView: View {
    @Binding var value: Double
    var body: some View {
        HStack {
            SliderLabelText(text: "1")
            Slider(value: $value, in: 1.0...100.0)
            SliderLabelText(text: "100")
        }
    }
}

struct HitMeButton: View {
    @Binding var alertIsVisible : Bool
    @Binding var sliderValue : Double
    @Binding var game : Game
    var body: some View {
        Button(action: {
            alertIsVisible = true
        }) {
            Text(("Hit me").uppercased())
                .bold()
                .font(.title3)
                .kerning(1.0)
        }
        .padding(20.0)
        .background(
            ZStack {
                Color("ButtonColor")
                LinearGradient(colors: [Color.white.opacity(0.3), Color.clear], startPoint: .top, endPoint: .bottom)
            }
        )
        .foregroundColor(Color.white)
        .cornerRadius(21.0)
        .overlay(
            RoundedRectangle(cornerRadius: 21.0).strokeBorder(Color.white, lineWidth: 2.0)
        )
        .alert("Hello there!", isPresented: $alertIsVisible) {
            Button("Awesome!") {}
        } message: {
            let roundedValue = Int(sliderValue.rounded())
            Text("The slider's value is: \(roundedValue).\n" +
                 "You scored \(game.points(sliderValue: (roundedValue))) points this round.")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
