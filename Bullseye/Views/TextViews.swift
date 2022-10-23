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

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        InstructionText(text: "Instructions")
        BigNumberText(number: 50)
        SliderLabelText(text: "2")
        LabelText(text: "Round")
        RoundRectText(numberText: "20")
   
    }
}
