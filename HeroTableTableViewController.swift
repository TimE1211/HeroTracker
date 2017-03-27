//
//  HeroTableTableViewController.swift
//  HeroTracker
//
//  Created by Timothy Hang on 3/27/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

import UIKit

class HeroTableTableViewController: UITableViewController
{
  var heroes = [Hero]()
  
  let nameDescriptor = NSSortDescriptor(key: "name", ascending: true,
                                        selector: #selector(NSString.localizedCaseInsensitiveCompare(_:)))
  //http://chris.eidhof.nl/post/sort-descriptors-in-swift/
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    loadHeroes()
    title = "S.H.I.E.L.D. Hero Tracker"
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int
  {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
  {
    return heroes.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
  {
    let cell = tableView.dequeueReusableCell(withIdentifier: "HeroCell", for: indexPath)
    
    // Configure the cell...
    let aHero = heroes[indexPath.row]
    cell.textLabel?.text = aHero.name
    return cell
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    let selectedIndexPath = tableView.indexPath(for: sender as! UITableViewCell)!
    let selectedHero = heroes[selectedIndexPath.row]
    let heroDetailVC = segue.destination as! HeroDetailViewController
    heroDetailVC.hero = selectedHero
  }
  
  func loadHeroes()
  {
    do
    {
      let filePath = Bundle.main.path(forResource: "heroes", ofType: "json")
      let dataFromFile = try? Data(contentsOf: URL(fileURLWithPath: filePath!))
      let heroData: [[String: Any]] = try JSONSerialization.jsonObject(with: dataFromFile!, options: []) as! [[String: Any]]
      for heroDictionary in heroData
      {
        let aHero = Hero(heroDictionary: heroDictionary)
        heroes.append(aHero)
        (heroes as NSArray).sortedArray(using: [nameDescriptor])  //http://chris.eidhof.nl/post/sort-descriptors-in-swift/
      }
    }
    catch let error as NSError
    {
      print(error)
    }
  }
  
}

