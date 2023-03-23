//
//  ContentView.swift
//  ScrumTranscript
//
//  Created by admin on 23/3/23.
//

import SwiftUI
import AVFoundation
import MediaPlayer

struct ContentView: View {
  
  @State var textValue: String = "The transcription text"
  @StateObject var speechRecognizer = SpeechRecognizer()
  
  private var player: AVPlayer { AVPlayer.sharedDingPlayer }
  
    var body: some View {
        VStack {
            Image(systemName: "mic")
                .imageScale(.large)
                .foregroundColor(.accentColor)
          Text(textValue)
          HStack(spacing: 64) {
            Button {
            
              print("starting")
              self.textValue = "New Text"
              
              player.seek(to: .zero)
              player.play()

              speechRecognizer.reset()
              speechRecognizer.transcribe()

            } label: {
              Text("Start")
            }
            Button {
              print("Stop")
              
              speechRecognizer.stopTranscribing()
              print(speechRecognizer.transcript)
            } label: {
              Text("Stopping")
            }

          }
        }
        .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
