//
//  AlbumDetailViewController.swift
//  iMusic
//
//  Created by Ranjith on 12/12/17.
//  Copyright © 2017 Ranjith. All rights reserved.
//

import Foundation
import UIKit
import SafariServices

class AlbumDetailViewController: UIViewController {
    var albumInfo: Album? = nil
    let imageLoader = ImageCacheLoader()
    
    var scrollView: UIScrollView!
    var stackView: UIStackView!
    
    func configure(album: Album) {
        self.albumInfo = album
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        guard let album = self.albumInfo else {
            return
        }
        self.title = album.name
        
        updateUI(album: album)
    }
    
    func updateUI(album: Album) {
        scrollView = UIScrollView(frame: self.view.bounds)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[scrollView]|", options: .alignAllCenterX, metrics: nil, views: ["scrollView": scrollView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[scrollView]|", options: .alignAllCenterX, metrics: nil, views: ["scrollView": scrollView]))
        
        
        stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 5
        scrollView.addSubview(stackView)
        
        scrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[stackView]|", options: NSLayoutFormatOptions.alignAllCenterX, metrics: nil, views: ["stackView": stackView]))
        scrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[stackView]", options: NSLayoutFormatOptions.alignAllCenterX, metrics: nil, views: ["stackView": stackView]))
        
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        if let imageURL = album.artworkUrl100 {
            imageLoader.obtainImageWithPath(imagePath: imageURL) { (image) in
                imageView.image = image
            }
        }
        stackView.addArrangedSubview(imageView)
        
        stackView.addArrangedSubview(getStackView(title: "Album: ", text: album.name))
        stackView.addArrangedSubview(getStackView(title: "Artist: ", text: album.artistName))
        
        let genre = album.genres.flatMap({ $0.name }).joined(separator: ", ")
        stackView.addArrangedSubview(getStackView(title: "Genre: ", text: genre))
        
        stackView.addArrangedSubview(getStackView(title: "Release Date: ", text: album.releaseDate))
        
        stackView.addArrangedSubview(getStackView(text: album.copyright, axis: .vertical, alignment: UIStackViewAlignment.center))
        
        let itunesButton = UIButton(type: .roundedRect)
        itunesButton.setTitle("Go to iTunes", for: .normal)
        itunesButton.addTarget(self, action: #selector(AlbumDetailViewController.goToItunes(sender:)), for: .touchUpInside)
        stackView.addArrangedSubview(itunesButton)
    }
    
    func getStackView(title: String? = nil, text: String, axis: UILayoutConstraintAxis? = .horizontal, alignment: UIStackViewAlignment? = .fill) -> UIStackView {
        let nameStackView = UIStackView()
        nameStackView.axis = axis!
        nameStackView.alignment = alignment!
        nameStackView.distribution = .fill
        nameStackView.spacing = 5
        
        if let titleText = title {
            let nameTitleLabel = UILabel()
            nameTitleLabel.numberOfLines = 0
            nameTitleLabel.lineBreakMode = .byWordWrapping
            nameTitleLabel.text = titleText
            nameTitleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
            nameStackView.addArrangedSubview(nameTitleLabel)
        }
        
        let nameLabel = UILabel()
        nameLabel.numberOfLines = 0
        nameLabel.lineBreakMode = .byWordWrapping
        nameLabel.text = text
        nameLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        nameStackView.addArrangedSubview(nameLabel)
        return nameStackView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: stackView.frame.height)
    }
    
    @objc func goToItunes(sender: Any) {
        guard let urlStr = albumInfo?.url, let url = URL(string: urlStr) else { return }
        let svc = SFSafariViewController(url: url)
        self.present(svc, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
