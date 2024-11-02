//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

/*
 
import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player : AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func keyPressed(_ sender: UIButton) {
        playSound()
    }
    /*
     taking the function from 'stackoverflow' and making some changes as
     forResource: "C" and withExtensions: "wav" , the extension of our
     sound is "wav" not "mp3".
    */
    func playSound() 
    {
        guard let url = Bundle.main.url(forResource: "C", withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly
             */
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) 
             */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }

}

*/

import UIKit
import AVFoundation

class ViewController: UIViewController 
{
    
    var player: AVAudioPlayer!

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) 
    {
        playSound(soundName: sender.currentTitle!)
        
        /*
         If a button with the title "C" is pressed , then
         -> 'sender.currentTitle' will be "C".
         -> 'playSound(soundName: "C")' will be called.
         -> The 'playSound' function will then try to find and play a file named 'C.wav'.
        */
    }
    
    /*
     -> Now , the code is bit simpler but we have got little bit
     of functionality than before but it's fine for our needs.
     
     -> Remember because we took away the parts which allow our
     sound to be played when the phone is on silent , so if you
     run this app now and your phone is on your silent on your
     physical device , then it will not make a sound !
     
     -> we have modified the function in such a way that it will take input
     as string which will be the name of song , because of which we will be
     able to use different voices.
    */
    
    /*
     Why It Still Works:
     Simplified Assumptions: The code makes several assumptions (like the audio
     file being present and the app not needing custom audio session
     configurations) that may hold in simple cases. The app uses default
     behaviors and succeeds without errors, as long as these assumptions remain
     true.
    */
    func playSound(soundName: String)
    {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}

/*
All info about "sender" :-
 
Detailed Explanation:
->'@IBAction func keyPressed(_ sender: UIButton)': This is an action method connected to a button in your storyboard or xib file.
->'sender': The parameter 'sender' is of type 'UIButton'. It refers to the specific button that was tapped by the user.
 
 
 How It Works:
 When a button is pressed, it triggers the 'keyPressed' method. The 'sender'
 parameter in the method contains information about the button that was pressed. You
 use 'sender' to access properties of that button, such as its title or tag, to
 determine which button was pressed and to perform the appropriate action.

 
 Example:
 If you have multiple buttons (e.g., for different notes in your xylophone app),
 'sender' allows you to determine which button was pressed and then act accordingly.
*/
