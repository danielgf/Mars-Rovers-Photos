//
//  UITableViewCell+UICollectionViewCell+RegisterCell.swift
//  Mars Rovers Photos
//
//  Created by Daniel Griso Filho on 15/02/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import UIKit

func cellReuseId(_ c: AnyClass) -> String {
    return String(describing: c)
}

extension UITableViewCell {
    static func cellReuseId() -> String {
        return String(describing: self)
    }
}

extension UICollectionViewCell {
    static func cellReuseId() -> String {
        return String(describing: self)
    }
}

extension UIView: UITextFieldDelegate {
    
    func registerCellClass(_ c: AnyClass) {
        if self is UICollectionView {
            (self as! UICollectionView).register(c, forCellWithReuseIdentifier: cellReuseId(c))
            
        } else if self is UITableView {
            (self as! UITableView).register(c, forCellReuseIdentifier: cellReuseId(c))
        }
    }
    
    func registerNibCell(_ c: AnyClass) {
        let nib = UINib(nibName: cellReuseId(c), bundle: nil)
        if self is UICollectionView {
            (self as! UICollectionView).register(nib, forCellWithReuseIdentifier: cellReuseId(c))
            
        } else if self is UITableView {
            (self as! UITableView).register(nib, forCellReuseIdentifier: cellReuseId(c))
        }
    }
    
    func addToolBar(textField: UITextField) {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(donePressed))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        textField.delegate = self
        textField.inputAccessoryView = toolBar
    }
    
    @objc func donePressed(){
        self.endEditing(true)
    }
}
