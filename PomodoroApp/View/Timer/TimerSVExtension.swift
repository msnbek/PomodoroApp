//
//  setupViewExtension.swift
//  PomodoroApp
//
//  Created by Mahmut Senbek on 7.03.2023.
//

import UIKit

extension TimerController {
    func setUpView() {
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .clear
        timerView.sessionInfoLabel.isHidden = true
        timerView.startButton.isEnabled = false
        timerView.stopButton.isEnabled = false
        view.addSubview(timerView.studyTimePopUpButton)
        view.addSubview(timerView.musicPopUpButton)
        view.addSubview(timerView.startMusicButton)
        view.addSubview(timerView.stopMusicButton)
        view.addSubview(timerView.volumeSlider)
        view.addSubview(timerView.startImage)
        view.addSubview(timerView.stopImage)
        view.addSubview(timerView.startButton)
        view.addSubview(timerView.stopButton)
        view.addSubview(timerView.timeLabel)
        view.addSubview(timerView.sessionInfoLabel)
        timerView.stopMusicButton.translatesAutoresizingMaskIntoConstraints = false
        timerView.volumeSlider.translatesAutoresizingMaskIntoConstraints = false
        timerView.studyTimePopUpButton.translatesAutoresizingMaskIntoConstraints = false
        timerView.musicPopUpButton.translatesAutoresizingMaskIntoConstraints = false
        timerView.startMusicButton.translatesAutoresizingMaskIntoConstraints = false
        timerView.startImage.translatesAutoresizingMaskIntoConstraints = false
        timerView.stopImage.translatesAutoresizingMaskIntoConstraints = false
        timerView.startButton.translatesAutoresizingMaskIntoConstraints = false
        timerView.stopButton.translatesAutoresizingMaskIntoConstraints = false
        timerView.timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timerView.sessionInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        timerView.studyTimePopUpButton.addTarget(self, action: #selector(studyTimePopUpButtonClicked), for: .touchUpInside)
        timerView.musicPopUpButton.addTarget(self, action: #selector(musicPopUpBtnClicked), for: .touchUpInside)
        timerView.volumeSlider.addTarget(self, action: #selector(sliderValueDidChange), for: .valueChanged)
        timerView.stopMusicButton.addTarget(self, action: #selector(musicStopButtonClicked), for: .touchUpInside)
        timerView.startMusicButton.addTarget(self, action: #selector(startMusicButtonClicked), for: .touchUpInside)
        timerView.startButton.addTarget(self, action: #selector(startTimeButtonClicked), for: .touchUpInside)
        timerView.stopButton.addTarget(self, action: #selector(stopTimeButtonClicked), for: .touchUpInside)
       
        
        NSLayoutConstraint.activate([
            
            //MARK: - TimePopUp
            view.topAnchor.constraint(equalTo: timerView.studyTimePopUpButton.topAnchor, constant: -(view.frame.size.height / 13)),
            timerView.studyTimePopUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            timerView.studyTimePopUpButton.heightAnchor.constraint(equalToConstant: view.frame.size.width / 6),
            timerView.studyTimePopUpButton.widthAnchor.constraint(equalToConstant: view.frame.size.width / 3.5),
            
            //MARK: - MusicPopUp
            view.topAnchor.constraint(equalTo: timerView.musicPopUpButton.topAnchor, constant: -(view.frame.size.height / 13)),
            timerView.musicPopUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            timerView.musicPopUpButton.heightAnchor.constraint(equalToConstant: view.frame.size.width / 6),
            timerView.musicPopUpButton.widthAnchor.constraint(equalToConstant: view.frame.size.width / 3.5),
            
            //MARK: - VolumeSlider
            timerView.volumeSlider.topAnchor.constraint(equalTo: timerView.musicPopUpButton.bottomAnchor, constant: 15),
            timerView.volumeSlider.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            timerView.volumeSlider.widthAnchor.constraint(equalToConstant: 135),
            
            //MARK: - StopMusic
            timerView.stopMusicButton.topAnchor.constraint(equalTo: timerView.volumeSlider.bottomAnchor, constant: 10),
            timerView.stopMusicButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -45),
            timerView.stopMusicButton.widthAnchor.constraint(equalToConstant: 30),
            timerView.stopMusicButton.heightAnchor.constraint(equalToConstant: 30),
            
            //MARK: - StartMusic
            timerView.startMusicButton.trailingAnchor.constraint(equalTo: timerView.stopMusicButton.leadingAnchor, constant: -15),
            timerView.startMusicButton.widthAnchor.constraint(equalToConstant: 30),
            timerView.startMusicButton.heightAnchor.constraint(equalToConstant: 30),
            timerView.startMusicButton.topAnchor.constraint(equalTo: timerView.volumeSlider.bottomAnchor, constant: 10),
            
            //MARK: - StartImage
            timerView.startImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(view.frame.size.width / 10)),
            timerView.startImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(view.frame.size.height / 8)),
            timerView.startImage.heightAnchor.constraint(equalToConstant: view.frame.size.width / 4.5),
            timerView.startImage.widthAnchor.constraint(equalToConstant: view.frame.size.width / 4.5),
            
            //MARK: - StopImage
            timerView.stopImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: (view.frame.size.width / 10)),
            timerView.stopImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(view.frame.size.height / 8)),
            timerView.stopImage.heightAnchor.constraint(equalToConstant: view.frame.size.width / 4.5),
            timerView.stopImage.widthAnchor.constraint(equalToConstant: view.frame.size.width / 4.5),
            
            //MARK: - StartButton
            timerView.startButton.centerYAnchor.constraint(equalTo: timerView.startImage.centerYAnchor),
            timerView.startButton.centerXAnchor.constraint(equalTo: timerView.startImage.centerXAnchor),
            timerView.startButton.heightAnchor.constraint(equalToConstant: view.frame.size.width / 15),
            timerView.startButton.widthAnchor.constraint(equalToConstant: view.frame.size.width / 15),
            
            //MARK: - stopButton
            timerView.stopButton.centerYAnchor.constraint(equalTo: timerView.stopImage.centerYAnchor),
            timerView.stopButton.centerXAnchor.constraint(equalTo: timerView.stopImage.centerXAnchor),
            timerView.stopButton.heightAnchor.constraint(equalToConstant: view.frame.size.width / 15),
            timerView.stopButton.widthAnchor.constraint(equalToConstant: view.frame.size.width / 15),
            
            //MARK: - TimeLabel
            timerView.timeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timerView.timeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            //MARK: - SessionInfoLabel
            
            timerView.sessionInfoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timerView.sessionInfoLabel.topAnchor.constraint(equalTo: timerView.timeLabel.bottomAnchor, constant: view.frame.size.height / 6.5),
            
        
        ])
    }
}
