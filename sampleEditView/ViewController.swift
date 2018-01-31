//
//  ViewController.swift
//  sampleEditView
//
//  Created by Eriko Ichinohe on 2018/01/31.
//  Copyright © 2018年 Eriko Ichinohe. All rights reserved.
//

import UIKit

//プロトコルを指定することによりテキストの入力開始イベントに紐付いたメソッドが使用できる（ストーリーボードでtextFieldのdelegeteの紐付け先をViewControllerにしておくこと）
class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var formView: UIView!
    
    @IBOutlet weak var txtTitle: UITextField!
    
    @IBOutlet weak var txtDate: UITextField!
    
    @IBOutlet weak var txtContents: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //キーボードの上にCloseボタンを配置する
        //1.ビューを作成
        let upView = UIView()
        upView.frame.size.height = 60
        upView.backgroundColor = UIColor.lightGray
        
        //2.閉じるボタンを作成
        let closeButton = UIButton(frame: CGRect(x: self.view.bounds.size.width - 75, y: 0, width: 70, height: 50))
        closeButton.setTitle("Close", for: .normal)
        //2-1.ボタンのイベントを追加
        closeButton.addTarget(self, action: #selector(closeKeyboard(_:)), for: .touchUpInside)
        //3.ビューに閉じるボタンを追加
        upView.addSubview(closeButton)
        
        //4.キーボードのアクセサリービューに作ったビューを設定する
        txtTitle.inputAccessoryView = upView
        
    }
    
    //キーボードを閉じる
    @objc func closeKeyboard(_ sender: UIButton){
        txtTitle.resignFirstResponder()
    }
    
    //テキストフィールドに入力が開始された時発動
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("編集開始")
        print(textField.tag)
        
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

