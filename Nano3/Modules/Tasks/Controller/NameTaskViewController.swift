//
//  NameTaskViewController.swift
//  Nano3
//
//  Created by Felipe Melo on 2/10/18.
//  Copyright © 2018 Felipe Melo. All rights reserved.
//

import UIKit

class NameTaskViewController: UIViewController {

    // Constants
    let NEW_TASK_VC = "newTaskVC"
    let ICON_CELL_IDENTIFIER = "iconCellIdentifier"
    let ICON_COUNT = 100
    
    // Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Private
    private var currentIconSelected: IconViewCell?
    private var hasToConfigureSelectImage = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setup() {
        self.setupCollectionView()
        
        let tapRecognizer =
            UITapGestureRecognizer(
                target: self,
                action: #selector(dismissKeyboard)
            )
        
        self.view.addGestureRecognizer(tapRecognizer)
    }
    
    @IBAction func nextButtonClicked(_ sender: UIBarButtonItem) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: NEW_TASK_VC) as! NewTaskViewController
        
        vc.createTask(name: self.nameTextField.text!, image: (self.currentIconSelected?.image.image)!)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func selectIcon(cell: IconViewCell) {
        if let currentIcon = self.currentIconSelected {
            currentIcon.deselectIcon()
        }
        
        cell.selectIcon()
        self.currentIconSelected = cell
    }
}

// selectors
extension NameTaskViewController {
    @objc private func dismissKeyboard() {
        self.view.endEditing(true)
    }
}

extension NameTaskViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func setupCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.allowsSelection = true
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.ICON_COUNT
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.ICON_CELL_IDENTIFIER, for: indexPath) as! IconViewCell
        if let image = UIImage(named: "icon-\(indexPath.row + 1)") {
            cell.setup(image: image, vc: self)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! IconViewCell

        print("selected:\(indexPath)")
        self.selectIcon(cell: cell)
    }
    
}
