//
//  ContentView.swift
//  SessionHelprApp
//
//  Created by John Thomsen on 15/03/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingDetail = false
    let sessions: [Session] = [    .init(weekDay: "Wednesday", session: [.init(workout: "Plank", setAmount: 3, setDuration: 90)]),
                                      .init(weekDay: "Thursday", session: [.init(workout: "Squat", setAmount: 3, setDuration: 90), .init(workout: "Plank", setAmount: 3, setDuration: 90)]),
                                      .init(weekDay: "Friday", session: [.init(workout: "Squat", setAmount: 3, setDuration: 90), .init(workout: "Plank", setAmount: 3, setDuration: 90)]),
                                      .init(weekDay: "Saturday", session:[.init(workout: "Squat", setAmount: 3, setDuration: 90), .init(workout: "Plank", setAmount: 3, setDuration: 90)]),
                                      .init(weekDay: "Sunday", session:[.init(workout: "Squat", setAmount: 3, setDuration: 90), .init(workout: "Plank", setAmount: 3, setDuration: 90)])]
    
    var body: some View {
        
        NavigationStack{
            List{
                ForEach(sessions, id: \.self) { sessionDay in
                    NavigationLink(value: sessionDay) {
                        VStack{
                            Spacer()
                            HStack{
                                Label(sessionDay.weekDay, systemImage: "pc")
                            }
                            Spacer()
                        }.frame(width: .infinity, height: 100)
                    }
                }
            }.navigationDestination(for: Session.self){session in
                ZStack{
                    SessionView(session: session)
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
    }
}
