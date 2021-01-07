//
//  ViewController.swift
//  UIKit Elements
//
//  Created by Igor Loginov on 06.01.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = indexPath.row.isMultiple(of: 2) ? .green : .cyan
        cell.textLabel?.text = "Row: \(indexPath.row)"
        return cell
    }
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var horseImageView: UIImageView!
    @IBOutlet weak var poemTextView: UITextView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Функция \(#function)"
        label.textColor = .blue
        horseImageView.image = UIImage(named: "horse")
        if let text = poemTextView.text {
            poemTextView.text = String(text.reversed())
        }
        
        // UIScrollView 07/01/2021 update
        let imageView = UIImageView(image: UIImage(named: "horse"))
        let scrollView = UIScrollView(frame: CGRect(x: view.bounds.midX - 50 , y: 100, width: 100, height: 100))
        scrollView.backgroundColor = .black
        scrollView.contentSize = imageView.bounds.size
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.addSubview(imageView)
        view.addSubview(scrollView)
        
        // UITableView
        tableView.backgroundColor = .cyan
        tableView.dataSource = self
        
    }
    
}
