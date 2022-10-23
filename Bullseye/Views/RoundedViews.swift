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
            .frame(width:Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .overlay {
                Circle().strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
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
            .frame(width:Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
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
            .frame(width:Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
            .overlay {
                RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius).strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
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
