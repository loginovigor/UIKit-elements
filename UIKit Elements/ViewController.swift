//
//  ViewController.swift
//  UIKit Elements
//
//  Created by Igor Loginov on 06.01.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var count = 0 {
        didSet {
            updateButton()
        }
    }
    
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
    @IBOutlet weak var button: UIButton!
    
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
        
        // UIButton
        
    }
    
    func updateButton() {
        button.setTitle("Count: \(count)", for: [])
        
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
       count += 1
   
    }
    
    @IBAction func segmentSelected(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            count = 0
        case 1:
            count -= 1
        case 2:
            count += 1
        default:
            break
        }
    }
    
    @IBAction func dataEntered(_ sender: UITextField) {
        print(#line, #function, sender.text ?? "nil", sender.tag)
    }
    
    @IBAction func sliderValueChange(_ sender: UISlider) {
        sender.value = Float(25 * Int(sender.value / 25))
        print(#line, #function, sender.value)
    }
    @IBAction func switchPressed(_ sender: UISwitch) {
        view.backgroundColor = sender.isOn ? .white : .cyan
    }
    
    @IBAction func dataPicked(_ sender: UIDatePicker) {
        print(#line, #function, sender.date)
    }
    
}
    
    


