//
//  ViewController.swift
//  MiniApp-UserDefaults
//
//  Created by 近藤米功 on 2022/04/19.
//

import UIKit
struct Task{
    var detail: String
    var category: String
}
class ViewController: UIViewController, UITextFieldDelegate {
    var count: Int = 0
    var task = Task(detail: "", category: "")

    @IBOutlet var detailTextField: UITextField!
    @IBOutlet var categoryTextField: UITextField!

    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var categoryLabel: UILabel!

    private var savedDetail: String = ""
    private var savedCategory: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        detailTextField.delegate = self
        categoryTextField.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if UserDefaults.standard.object(forKey: "savedDetailKey") != nil, UserDefaults.standard.object(forKey: "savedCategoryKey") != nil {
            savedDetail = UserDefaults.standard.object(forKey: "savedDetailKey") as! String
            savedCategory = UserDefaults.standard.object(forKey: "savedCategoryKey") as! String
        }
        detailLabel.text = savedDetail
        categoryLabel.text = savedCategory
    }

    @IBAction func tappedDetailSaveButton(_ sender: Any) {
        detailLabel.text = detailTextField.text
        savedDetail = detailLabel.text ?? ""
        UserDefaults.standard.set(savedDetail,forKey: "savedDetailKey")
    }

    @IBAction func tappedCategorySaveButton(_ sender: Any) {
        categoryLabel.text = categoryTextField.text
        savedCategory = categoryLabel.text ?? ""
        UserDefaults.standard.set(savedCategory,forKey: "savedCategoryKey")
    }

}

