//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Demet Çalışkan on 27.11.2022.
//

import SwiftUI

struct LeaderboardView: View {
    @Binding var leaderboardIsShowing: Bool
    @Binding var game: Game
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 10) {
                HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
                LabelView()
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(game.leaderboardEntries.indices, id: \.self) { i in
                            let leaderboardEntry = game.leaderboardEntries[i]
                            RowView(
                                index: i + 1,
                                score: leaderboardEntry.score,
                                date: leaderboardEntry.date
                            )
                        }
                    }
                }
            }
        }
    }
}

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date
    
    var body: some View {
        HStack {
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(scoreText: String(score))
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            DateText(date: date).padding()
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(
                    Color ("LeaderboardRowColor"),
                    lineWidth: Constants.General.strokeWidth
                )
            )
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}

struct HeaderView: View {
    @Binding var leaderboardIsShowing: Bool
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var body: some View {
            ZStack {
                    if (verticalSizeClass == .regular && horizontalSizeClass == .compact) {
                        BigBoldText(text: "Leaderboard")
                        Spacer()
                    } else {
                        BigBoldText(text: "Leaderboard")
                            .padding(.leading)
                    }
       
                HStack {
                    Spacer()
                    Button(action: {
                        leaderboardIsShowing = false
                    }) {
                        RoundedImageViewFilled(systemName: "xmark")
                            .padding(.trailing)
                    }
                }
         
            }.padding(.top, 30.0)
    }
}

struct LabelView: View {
    var body: some View {
        HStack {
            Spacer()
                .frame(width: Constants.General.roundedViewLength)
            Spacer()
            LabelText(text: "Score")
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            LabelText(text: "Date")
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
        }
        .padding(.leading)
        .padding(.trailing)
        .frame(
            maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth
        )
    }
}


struct LeaderboardView_Previews: PreviewProvider {
    static private var leaderboardIsShowing = Binding.constant(false)
    static private var game = Binding.constant(Game(loadTestData: true))
    static var previews: some View {
        LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
    }
}
