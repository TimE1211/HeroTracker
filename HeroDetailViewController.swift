//
//  HeroDetailViewController.swift
//  HeroTracker
//
//  Created by Timothy Hang on 3/27/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

import UIKit

class HeroDetailViewController: UIViewController
{
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var homeworldLabel: UILabel!
  @IBOutlet weak var powersLabel: UILabel!
  var hero: Hero!
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    nameLabel.text = hero.name
    homeworldLabel.text = hero.homeworld
    powersLabel.text = hero.powers
  }
  
  override func didReceiveMemoryWarning()
  {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }
  

  /*
  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      // Get the new view controller using segue.destinationViewController.
      // Pass the selected object to the new view controller.
  }
  */

}
