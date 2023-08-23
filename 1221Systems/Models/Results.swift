/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Results : Codable {
	let id : Int?
	let name : String?
	let status : String?
	let species : String?
	let type : String?
	let gender : String?
	let origin : Origin?
	let location : Location?
	let image : String?
	let episode : [String]?
	let url : String?
	let created : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case status = "status"
		case species = "species"
		case type = "type"
		case gender = "gender"
		case origin = "origin"
		case location = "location"
		case image = "image"
		case episode = "episode"
		case url = "url"
		case created = "created"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		species = try values.decodeIfPresent(String.self, forKey: .species)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		gender = try values.decodeIfPresent(String.self, forKey: .gender)
		origin = try values.decodeIfPresent(Origin.self, forKey: .origin)
		location = try values.decodeIfPresent(Location.self, forKey: .location)
		image = try values.decodeIfPresent(String.self, forKey: .image)
		episode = try values.decodeIfPresent([String].self, forKey: .episode)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		created = try values.decodeIfPresent(String.self, forKey: .created)
	}

}