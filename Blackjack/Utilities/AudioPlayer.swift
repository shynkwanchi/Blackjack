/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 28/08/2023
  Last modified: 29/08/2023
  Acknowledgement: None
*/

import AVFoundation

var soundEffectPlayer: AVAudioPlayer?
var secondSoundEffectPlayer: AVAudioPlayer?
var announcementPlayer: AVAudioPlayer?
var backgroundMusicPlayer: AVAudioPlayer?

// This function is used to play sound effects of user actions such as button tap
func playSoundEffect(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            soundEffectPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            soundEffectPlayer?.setVolume(2.0, fadeDuration: 0.0)
            soundEffectPlayer?.play()
        } catch {
            print("ERROR: Could not find and play the sound file!")
        }
    }
}

// This extra function is implemented to avoid stopping playing current sound effects
func playSecondSoundEffect(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            secondSoundEffectPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            secondSoundEffectPlayer?.setVolume(1.5, fadeDuration: 0.0)
            secondSoundEffectPlayer?.play()
        } catch {
            print("ERROR: Could not find and play the sound file!")
        }
    }
}

// This function is used to play announcement sound effects such as game result and round result
func playAnnouncement(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            announcementPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            announcementPlayer?.play()
        } catch {
            print("ERROR: Could not find and play the sound file!")
        }
    }
}

// This function is used to play background music with infinite loop
func playBackgroundMusic(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            backgroundMusicPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            backgroundMusicPlayer?.numberOfLoops = -1
            backgroundMusicPlayer?.setVolume(0.75, fadeDuration: 0.5)
            backgroundMusicPlayer?.play()
        } catch {
            print("ERROR: Could not find and play the sound file!")
        }
    }
}

// This function is used to stop playing current sounds
func stopPlayingSounds() {
    soundEffectPlayer?.stop()
    secondSoundEffectPlayer?.stop()
    announcementPlayer?.stop()
    backgroundMusicPlayer?.stop()
}
