//
//  ConcentrationThemeChooserViewController.swift
//  L7_Concentration
//
//  Created by Анастасия Латыш on 11/12/2018.
//  Copyright © 2018 Анастасия Латыш. All rights reserved.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController, UISplitViewControllerDelegate {

    let themes = [
        "Sports":"⚽️🏀🏈⚾️🎾🏐🏉🎱🏓⛷🎳⛳️",
        "Animals":"🐶🦆🐹🐸🐘🦍🐓🐩🐦🦋🐙🐏",
        "Faces":"😀😌😎🤓😠😤😭😰😱😳😜😇"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        splitViewController?.delegate = self
    }
    
    func splitViewController(_ splitViewController: UISplitViewController,
                             collapseSecondary secondaryViewController: UIViewController,
                             onto primaryViewController: UIViewController
        ) -> Bool
    {
        if let cvc = secondaryViewController as? ConcentrationViewController {
            return cvc.theme == nil
        }
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {
                if let themeName = (sender as? UIButton)?.currentTitle , let theme = themes[themeName] {
                    if let cvc = segue.destination as? ConcentrationViewController{
                        cvc.theme = theme
                    }
                    
                }
        }
    }


}
