//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Demet Çalışkan on 23.10.2022.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game
    var body: some View {
        VStack {
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(RingsView())
    }
}

struct TopView: View {
    @Binding var game: Game
    var body: some View {
        HStack {
            Button(action: {
                game.restart()
            }) {
                RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            }
            Spacer()
            RoundedImageViewFilled(systemName: "list.dash")
        }
    }
}


struct NumberView: View {
    var title: String
    var text: String
    var body: some View {
        VStack {
            LabelText(text: title.uppercased())
            RoundedTextViewStroked(text: text)
        }
    }
}

struct BottomView: View {
    @Binding var game: Game
    var body: some View {
        HStack {
            NumberView(title: "Score", text: String(game.score))
            Spacer()
            NumberView(title: "Round", text: String(game.round))
        }
    }
}

struct RingsView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            ForEach(1..<6) {ring in
                let size = CGFloat(ring * 100)
                let opacity = colorScheme == .dark ? 0.1 : 0.3
                Circle().stroke(lineWidth: 20.0).fill(
                    RadialGradient(colors: [Color("CircleColor").opacity(0.8*opacity), Color("CircleColor").opacity(0)], center: .center, startRadius: 100, endRadius: 300)
                )
                    .frame(width: size, height: size)
            }
          
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}
