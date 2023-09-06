//
//  ArticleView.swift
//  iNEWs
//
//  Created by Paulo Pinheiro on 9/6/23.
//

import SwiftUI
import URLImage
import URLImageStore

struct ArticleView: View {
    
    let article: Article
    
    
    var body: some View {
        HStack {
            
            let urlImageService = URLImageService(fileStore: URLImageFileStore(),
                                                  inMemoryStore: URLImageInMemoryStore())
            
            if let imgUrl = article.image,
               let url = URL(string: imgUrl) {
                
                URLImage(url, identifier: article.id.uuidString) {
                    
                    EmptyView()
                }  inProgress: { progress in
                    Text("Loading...")
                } failure: { error, _ in
                    
                    VStack {
                        Text(error.localizedDescription)
                        PlaceholderImageView()
                    }
                } content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .frame( width: 100, height: 100, alignment: .center)
                .cornerRadius(10)
                //   .environment(\.urlImageOptions, URLImageOptions(loadOptions: [ .loadOnAppear, .cancelOnDisappear ]))
                .environment(\.urlImageService, urlImageService)
                
            } else {
                PlaceholderImageView()
                
            }
            VStack(alignment: .leading, spacing: 4) {
                Text(article.title ?? "")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .semibold))
                Text(article.source ?? "N/A")
                    .font(.footnote)
            }
        }
             
    }
}

struct PlaceholderImageView: View {
    var body: some View {
        Image(systemName: "photo.fill")
            .foregroundColor(.white)
            .background(Color.gray)
            .frame(width: 100, height: 100)
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article.dummyData)
            .previewLayout(.sizeThatFits)
    }
}
