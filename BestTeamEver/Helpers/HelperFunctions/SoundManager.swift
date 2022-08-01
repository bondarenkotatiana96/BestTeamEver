//
//  SoundManager.swift
//  BestTeamEver
//
//  Created by Tatiana Bondarenko on 8/1/22.
//

import AVKit

class SoundManager {
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "kitten-sound", withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing the sound \(error)")
        }
    }
}
