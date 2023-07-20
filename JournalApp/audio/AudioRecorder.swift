//
//  AudioRecorder.swift
//  JournalApp
//
//  Created by Johnny on 7/16/23.
//

import AVFoundation

class AudioRecorder {
    private var audioRecorder: AVAudioRecorder?
    private var audioPlayer: AVAudioPlayer?


    func startRecording() {
        print("recording...")
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playAndRecord, mode: .default)
            try audioSession.setActive(true)
            
            guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
                return
            }
            
            let audioFileName = documentsDirectory.appendingPathComponent("recording.m4a")
            
            let settings:[String:Any] = [
                AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
                AVSampleRateKey: 44100.0,
                AVNumberOfChannelsKey: 2,
                AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
            ]
            
            audioRecorder = try AVAudioRecorder(url: audioFileName, settings: settings)
            audioRecorder?.record()
        } catch {
            print("Failed to start recording: \(error.localizedDescription)")
        }
    }
    
    func pauseRecording() {
        print("Pause...")
        audioRecorder?.pause()
    }
    func resumeRecording() {
        print("Resume...")
        audioRecorder?.record()
    }
    
    func saveRecording() -> URL? {
        guard let recordingURL = audioRecorder?.url else {
            print("Failed to access recording URL.")
            return nil
        }
        
        audioRecorder?.stop()
        audioRecorder = nil
        
        let fileManager = FileManager.default
        
        do {
            let documentsDirectory = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            
            // Generate a unique identifier using UUID
            let uniqueID = UUID().uuidString
            let destinationURL = documentsDirectory.appendingPathComponent("recording_\(uniqueID).m4a")
            
            try fileManager.moveItem(at: recordingURL, to: destinationURL)
            print("Recording saved successfully at: \(destinationURL)")
            
            return destinationURL
        } catch {
            print("Failed to save recording: \(error.localizedDescription)")
            return nil
        }
    }
    
    func playAudio(url: URL) {
        do {
            let audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.play()
        } catch {
            print("Failed to play audio: \(error.localizedDescription)")
        }
    }

    
    func pausePlayback() {
        audioPlayer?.pause()
    }
}

