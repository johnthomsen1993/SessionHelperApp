//
//  Session.swift
//  SessionHelperApp
//
//  Created by John Thomsen on 20/04/2023.
//

import SwiftUI


struct SessionView: View {
    @State var session: Session
    @State var counter = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var isPaused = true
    @State var task = 0
    
    var body: some View {
        NavigationView {
            VStack{
                Spacer()
                Text(session.session[task].workout)
                    .font(.title)
                Text(" \(counter)")
                    .font(.title)
                    .padding()
                HStack{
                    
                    Button(action: { self.counter = 0 }) {
                        Image(systemName: "stop")
                            .font(.system(size: 24))
                            .foregroundColor(.red)
                            .padding()
                    }
                    .padding()
                    Button(action: { self.isPaused.toggle() }) {
                        
                        Image(systemName: isPaused ? "play" : "pause")
                            .font(.system(size: 24))
                            .foregroundColor(.red)
                            .padding()
                    }
                    .padding()
                }
                Spacer()
                HStack{
                    Spacer()
                    Button(action: {
                        if(task == 0){
                            return
                        }
                        self.task -= 1 }
                    ) {
                        Text("Previous Session").foregroundColor(.white)
                    }
                    Spacer()
                    Button(action: {
                        if( self.session.session.count == self.task + 1){
                            return
                        }
                        
                        self.task += 1 }) {
                            Text("Next Session").foregroundColor(.white)
                        }
                    Spacer()
                }.frame( maxWidth: .infinity, minHeight: 80).background(Color(hex: "AA0000"))
                
            }.onReceive(timer) { _ in
                guard self.counter != session.session[task].setDuration else {
                    self.counter = 0
                    return
                }
                guard !isPaused else {return}
                self.counter += 1
                
            }
        }.navigationTitle(session.weekDay)
    }
    
}
