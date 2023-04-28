//
//  ViewController.swift
//  UserDefaultProject
//
//  Created by Canan Yavuz on 27.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var noteTextLabel: UITextField!
    
    @IBOutlet weak var whenTextLabel: UITextField!
    
    @IBOutlet weak var noteLabel: UILabel!
    
    @IBOutlet weak var whenLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let savedNote = UserDefaults.standard.object(forKey: "note")
        let savedWhen = UserDefaults.standard.object(forKey: "when")
        
        if let takenNote = savedNote as? String {
            noteLabel.text = "To Do: \(takenNote)"
        }
        if let takenWhen = savedWhen as? String {
            whenLabel.text = "When: \(takenWhen)"
        }
    }
    
    @IBAction func saveClick(_ sender: Any) {
        
        UserDefaults.standard.set(noteTextLabel.text!, forKey: "note")
        UserDefaults.standard.set(whenTextLabel.text!, forKey: "when")
        
        noteLabel.text = "To Do: \(noteTextLabel.text!)"
        whenLabel.text = "When: \(whenTextLabel.text!)"
    }
    
    @IBAction func removeClick(_ sender: Any) {
        
        let savedNote = UserDefaults.standard.object(forKey: "note")
        let savedWhen = UserDefaults.standard.object(forKey: "when")
        
        if (savedNote as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "note")
            noteLabel.text = "To Do: "
        }
        if (savedWhen as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "when")
            whenLabel.text = "When: "
        }
    }
    
    
    @IBAction func discartClick(_ sender: Any) {
        noteTextLabel.text = " "
        whenTextLabel.text = " "
    }
    
}

