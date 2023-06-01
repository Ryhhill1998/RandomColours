//
//  ColoursTableViewController.swift
//  RandomColours
//
//  Created by Ryan Henzell-Hill on 01/06/2023.
//

import UIKit

class ColoursTableViewController: UIViewController {
    var colours: [UIColor] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialiseRandomColours()
    }
    
    func initialiseRandomColours() {
        for _ in 1...50 {
            colours.append(createRandomColour())
        }
    }
    
    func createRandomColour() -> UIColor {
        return UIColor(red: generateRandomCGFloat(), green: generateRandomCGFloat(), blue: generateRandomCGFloat(), alpha: 1)
    }
    
    func generateRandomCGFloat() -> CGFloat {
        return CGFloat.random(in: 0...1)
    }
}

extension ColoursTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colours.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ColourCell") else {
            return UITableViewCell()
        }
        
        cell.backgroundColor = colours[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ToColoursDetailVC", sender: nil)
    }
}
