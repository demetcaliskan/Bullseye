//
//  TextViews.swift
//  Bullseye
//
//  Created by Demet Çalışkan on 23.10.2022.
//

import SwiftUI

struct InstructionText: View {
    var text: String
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(5.0)
            .font(.footnote)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigNumberText: View {
    var number: Int
    var body: some View {
        Text(String(number))
            .fontWeight(.black)
            .kerning(-1.0)
            .font(.largeTitle)
            .foregroundColor(Color("TextColor"))
    }
}

struct SliderLabelText: View {
    var text: String
    var body: some View {
        Text(text)
            .bold()
            .font(.body)
            .foregroundColor(Color("TextColor"))
            .frame(width: 35.0)
    }
}

struct LabelText: View {
    var text: String
    var body: some View {
        Text(text)
            .fontWeight(.semibold)
            .font(.caption)
            .foregroundColor(Color("TextColor"))
            .kerning(1.5)
    }
}


struct RoundRectText: View {
    var numberText: String
    var body: some View {
        Text(numberText)
            .bold()
            .font(.title2)
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
    }
}

struct BodyText: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .lineSpacing(5.0)
            .multilineTextAlignment(.center)
            .foregroundColor(Color("TextColor"))
    }
}

struct ButtonText: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.title2)
            .bold()
            .multilineTextAlignment(.center)
            .foregroundColor(Color.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .cornerRadius(12.0)
    }
}

struct ScoreText: View {
    var scoreText: String
    var body: some View {
        Text(scoreText)
            .bold()
            .font(.title2)
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
    }
}

struct DateText: View {
    var date: Date
    var body: some View {
        Text(date, style: .time)
            .bold()
            .font(.title2)
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigBoldText: View {
    let text: String
    var body: some View {
        Text(text.uppercased())
            .kerning(2.0)
            .foregroundColor(Color("TextColor"))
            .font(.title)
            .fontWeight(.black)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        InstructionText(text: "Instructions")
        BigNumberText(number: 50)
        SliderLabelText(text: "2")
        LabelText(text: "Round")
        RoundRectText(numberText: "20")
        BodyText(text: "You Scored 200 Points")
        ButtonText(text: "Start New Round")
        ScoreText(scoreText: "450")
        DateText(date: Date())
        BigBoldText(text: "header title")
    }
}
