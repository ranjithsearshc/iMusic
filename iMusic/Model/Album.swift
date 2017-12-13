//
//	Result.swift
//  iMusic
//
//  Created by Ranjith on 12/12/17.
//  Copyright © 2017 Ranjith. All rights reserved.
//

import Foundation

struct Album{

	var artistId : String!
	var artistName : String!
	var artistUrl : String!
	var artworkUrl100 : String!
	var copyright : String!
	var genres : [Genre]!
	var id : String!
	var kind : String!
	var name : String!
	var releaseDate : String!
	var url : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		artistId = dictionary["artistId"] as? String
		artistName = dictionary["artistName"] as? String
		artistUrl = dictionary["artistUrl"] as? String
		artworkUrl100 = dictionary["artworkUrl100"] as? String
		copyright = dictionary["copyright"] as? String
		genres = [Genre]()
		if let genresArray = dictionary["genres"] as? [[String:Any]]{
			for dic in genresArray{
				let value = Genre(fromDictionary: dic)
				genres.append(value)
			}
		}
		id = dictionary["id"] as? String
		kind = dictionary["kind"] as? String
		name = dictionary["name"] as? String
		releaseDate = dictionary["releaseDate"] as? String
		url = dictionary["url"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if artistId != nil{
			dictionary["artistId"] = artistId
		}
		if artistName != nil{
			dictionary["artistName"] = artistName
		}
		if artistUrl != nil{
			dictionary["artistUrl"] = artistUrl
		}
		if artworkUrl100 != nil{
			dictionary["artworkUrl100"] = artworkUrl100
		}
		if copyright != nil{
			dictionary["copyright"] = copyright
		}
		if genres != nil{
			var dictionaryElements = [[String:Any]]()
			for genresElement in genres {
				dictionaryElements.append(genresElement.toDictionary())
			}
			dictionary["genres"] = dictionaryElements
		}
		if id != nil{
			dictionary["id"] = id
		}
		if kind != nil{
			dictionary["kind"] = kind
		}
		if name != nil{
			dictionary["name"] = name
		}
		if releaseDate != nil{
			dictionary["releaseDate"] = releaseDate
		}
		if url != nil{
			dictionary["url"] = url
		}
		return dictionary
	}

}
