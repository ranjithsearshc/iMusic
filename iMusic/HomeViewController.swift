//
//  ViewController.swift
//  iMusic
//
//  Created by Ranjith on 12/12/17.
//  Copyright © 2017 Ranjith. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {
    let viewModel = HomeViewModel()
    let imageLoader = ImageCacheLoader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Top Albums"
        
        tableView?.rowHeight = UITableViewAutomaticDimension
        tableView?.estimatedRowHeight = 140

        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.center = self.view.center
        self.view.addSubview(activityIndicator)
        viewModel.fetchTopAlbums {
            self.tableView.reloadData()
            activityIndicator.stopAnimating()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension HomeViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSectionsToDisplay()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsToDisplay(in: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let album = viewModel.getAlbum(indexPath)
        let cell: UITableViewCell = {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumTableViewCell") else {
                return UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "AlbumTableViewCell")
            }
            return cell
        }()

        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.textLabel?.text = album.name
        
        cell.detailTextLabel?.numberOfLines = 0
        cell.detailTextLabel?.lineBreakMode = .byWordWrapping
        cell.detailTextLabel?.text = album.artistName
        if let imageURL = album.artworkUrl100 {
            imageLoader.obtainImageWithPath(imagePath: imageURL) { (image) in
                cell.imageView?.image = image
                cell.setNeedsLayout()
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let album = viewModel.getAlbum(indexPath)
        let detailVC = AlbumDetailViewController()
        detailVC.configure(album: album)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

