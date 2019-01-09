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

    
    
    // 이미지 선택을 완료했을 때 호출되는 메소드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 선택된 이미지를 미리보기에 표시한다.
        self.preview.image = info[.originalImage] as? UIImage
        
        // 이미지 피커 컨트롤러를 닫는다.
        picker.dismiss(animated: false)
    }

    func textViewDidChange(_ textView: UITextView) {
        let contents = textView.text as NSString
        let length = ( (contents.length > 15) ? 15 : contents.length )
        self.subject = contents.substring(with:NSRange(location: 0, length: length))
        
        self.navigationItem.title = subject
    }
    

    @IBAction func save(_ sender: Any) {
        guard self.contents.text?.isEmpty == false else{
            let alert = UIAlertController(title: nil,
                                          message: "내용을 입력해주세요",
                                          preferredStyle: .alert)
           return
        }
        
        let data = MemoData()
        
        data.title = self.subject
        data.contents = self.contents.text
        data.image = self.preview.image
        data.regdate = Date()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.memolist.append(data)
        
        _ = self.navigationController?.popViewController(animated: true)
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
