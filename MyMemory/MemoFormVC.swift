//
//  MemoFormVC.swift
//  MyMemory
//
//  Created by Ko's on 2019. 1. 7..
//  Copyright © 2019년 GOByeongjo. All rights reserved.
//

import UIKit

class MemoFormVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {

    var subject: String!
    @IBOutlet var contents: UITextView!
    @IBOutlet var preview: UIImageView!
    
    @IBAction func pick(_ sender: Any) {
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        
        self.present(picker, animated: false)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //self.preview.image = info as UIImage
        picker.dismiss(animated: false)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let contents = textView.text as NSString
        let length = ( (contents.substring(with: NSRange(location: 0, length:length))))
        
        testestsets
        
    }

    @IBAction func save(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        self.contents.delegate = self
        //super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
