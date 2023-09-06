//
//  Extensions.swift
//  iNEWs
//
//  Created by Paulo Pinheiro on 9/6/23.
//

import Foundation


extension Article {
    static var dummyData: Article {
        .init (
        author: "Joseph Wulfsohn",
        url: "https://www.foxnews.com/media/new-york-magazine-jonathan-chait-gina-carano-disney-hollywood-blacklist",
        source: "Fox News",
        title: "Disney's Gina Carano firing denounced as 'Hollywood Blacklist' against conservatives - Fox News",
        articleDescription: "Conservative actress Gina Carano found rare support among liberals in the mainstream media following her firing from The Mandalorian over social media posts and being dropped by her agency UTA.",
        image: "https://static.foxnews.com/foxnews.com/content/uploads/2021/02/Gina-Carano.jpg",
        date: Date ())
    }
}
