//
//  TimerView.swift
//  PomodoroApp
//
//  Created by Mahmut Senbek on 6.03.2023.
//

import UIKit

class TimerView : UIView {
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Properties
    
    let musicPopUpButton : UIButton = {
        let button = UIButton()
       button.backgroundColor = UIColor(hexString: "#F9D98C")
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.setTitle("Musics", for: UIControl.State.normal)
        button.setTitleColor(UIColor.black, for: UIControl.State.normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.layer.shadowColor = UIColor.black.withAlphaComponent(0.7).cgColor
        button.layer.shadowOffset = CGSize(width: 1, height: 1)
        button.layer.shadowOpacity = 3
        
        return button
    }()
    
    let studyTimePopUpButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(hexString: "#F9D98C")
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.setTitle("How many minutes do you want to study?", for: UIControl.State.normal)
        button.setTitleColor(UIColor.black, for: UIControl.State.normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.layer.shadowColor = UIColor.black.withAlphaComponent(0.7).cgColor
        button.layer.shadowOffset = CGSize(width: 1, height: 1)
        button.layer.shadowOpacity = 3
        
        return button
        
    }()
    
    let startMusicButton : UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .clear
        button.setImage(UIImage(systemName: "play.circle"), for: .normal)
        button.setTitleColor(.black, for: UIControl.State.normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.layer.cornerRadius = 3
        button.clipsToBounds = true
        button.imageView?.contentMode = .scaleAspectFill
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.tintColor = .black
        
        return button
    }()
    
    let stopMusicButton : UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .clear
        button.setImage(UIImage(systemName: "pause.circle"), for: .normal)
        button.setTitleColor(.black, for: UIControl.State.normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.layer.cornerRadius = 3
        button.clipsToBounds = true
        button.imageView?.contentMode = .scaleAspectFill
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.tintColor = .black
        
        return button
    }()
    
   let volumeSlider : UISlider = {
        let slider = UISlider(frame: CGRect(x: 0, y: 0, width: 300, height: 20))
        slider.thumbTintColor = .black
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.value = 0.2
        slider.minimumTrackTintColor = .black
        slider.isUserInteractionEnabled = true
        slider.isContinuous = true
        
        return slider
  
    }()
    
    let timeLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 27)
        label.textAlignment = .center
        label.text = "35:00"
        return label
    }()
    
    let sessionInfoLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.textAlignment = .center
        label.text = "35 min session"
        return label
    }()
    
    let startImage : UIImageView = {
        
        let image = UIImageView()
        image.image = UIImage(named: "buttonCircle")
        return image
        
    }()
    let stopImage : UIImageView = {
        
        let image = UIImageView()
        image.image = UIImage(named: "buttonCircle")
        return image
        
    }()
    
    let startButton : UIButton = {
        
        let button = UIButton()
        button.backgroundColor = .clear
        button.setImage(UIImage(systemName: "play"), for: .normal)
        button.setTitleColor(.black, for: UIControl.State.normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.layer.cornerRadius = 3
        button.clipsToBounds = true
        button.imageView?.contentMode = .scaleAspectFill
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
       
        return button
        
    }()
    
    let stopButton : UIButton = {
        
        let button = UIButton()
        button.backgroundColor = .clear
        button.setImage(UIImage(systemName: "stop"), for: .normal)
        button.setTitleColor(.black, for: UIControl.State.normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.layer.cornerRadius = 3
        button.clipsToBounds = true
        button.imageView?.contentMode = .scaleAspectFill
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
      
        return button
        
    }()
    
   
    
 
}
