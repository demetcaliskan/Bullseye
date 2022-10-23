//
//  RoundedViews.swift
//  Bullseye
//
//  Created by Demet Çalışkan on 23.10.2022.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width:56.0, height: 56.0)
            .overlay {
                Circle().strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2.0)
            }
    }
}

struct RoundedImageViewFilled: View {
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .padding(20.0)
            .frame(width:56.0, height: 56.0)
            .background(
                Circle().fill(Color("ButtonFilledBackgroundColor"))
            )
    }
}

struct RoundedTextViewStroked: View {
    var text: String
    var body: some View {
        ZStack {
            RoundRectText(numberText: text)
        }
            .frame(width:68.0, height: 56.0)
            .overlay {
                RoundedRectangle(cornerRadius: 21.0).strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2.0)
            }
    }
}

struct RoundedViews_Previews: PreviewProvider {
    static var previews: some View {
        RoundedImageViewStroked(systemName: "arrow.counterclockwise")
        RoundedImageViewFilled(systemName: "list.dash")
        RoundedTextViewStroked(text: "5")
    }
}
