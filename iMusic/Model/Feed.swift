//
//	Feed.swift
//  iMusic
//
//  Created by Ranjith on 12/12/17.
//  Copyright © 2017 Ranjith. All rights reserved.
//

import Foundation

struct Feed{

	var author : Author!
	var copyright : String!
	var country : String!
	var icon : String!
	var id : String!
	var links : [Link]!
	var results : [Album]!
	var title : String!
	var updated : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let authorData = dictionary["author"] as? [String:Any]{
				author = Author(fromDictionary: authorData)
			}
		copyright = dictionary["copyright"] as? String
		country = dictionary["country"] as? String
		icon = dictionary["icon"] as? String
		id = dictionary["id"] as? String
		links = [Link]()
		if let linksArray = dictionary["links"] as? [[String:Any]]{
			for dic in linksArray{
				let value = Link(fromDictionary: dic)
				links.append(value)
			}
		}
		results = [Album]()
		if let resultsArray = dictionary["results"] as? [[String:Any]]{
			for dic in resultsArray{
				let value = Album(fromDictionary: dic)
				results.append(value)
			}
		}
		title = dictionary["title"] as? String
		updated = dictionary["updated"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if author != nil{
			dictionary["author"] = author.toDictionary()
		}
		if copyright != nil{
			dictionary["copyright"] = copyright
		}
		if country != nil{
			dictionary["country"] = country
		}
		if icon != nil{
			dictionary["icon"] = icon
		}
		if id != nil{
			dictionary["id"] = id
		}
		if links != nil{
			var dictionaryElements = [[String:Any]]()
			for linksElement in links {
				dictionaryElements.append(linksElement.toDictionary())
			}
			dictionary["links"] = dictionaryElements
		}
		if results != nil{
			var dictionaryElements = [[String:Any]]()
			for resultsElement in results {
				dictionaryElements.append(resultsElement.toDictionary())
			}
			dictionary["results"] = dictionaryElements
		}
		if title != nil{
			dictionary["title"] = title
		}
		if updated != nil{
			dictionary["updated"] = updated
		}
		return dictionary
	}

}
