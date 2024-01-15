//
//  SampleViewController.swift
//  Demooo1
//
//  Created by Asif on 09/01/24.
//

import UIKit

class SampleViewController: UIViewController {
    lazy var myLabel = UILabel()
    
    @IBOutlet weak var superView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        myLabel.text = "Hello Hello Hello"
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        superView.addSubview(myLabel)
        
        NSLayoutConstraint.activate([
            myLabel.topAnchor.constraint(equalTo: superView.topAnchor, constant: 10),
            myLabel.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: 0),
            myLabel.widthAnchor.constraint(equalToConstant: 100),
            myLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
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
