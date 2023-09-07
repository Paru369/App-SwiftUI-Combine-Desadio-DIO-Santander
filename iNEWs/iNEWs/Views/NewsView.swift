//
//  NewsView.swift
//  iNEWs
//
//  Created by Paulo Pinheiro on 9/4/23.
//

import SwiftUI

struct NewsView: View {
    
    @Environment(\.openURL) var openURL
   @StateObject var viewModel = ArticleViewModelImpl(service: ArticleServiceImpl())
    
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .failed(let error):
                ErrorView(error: error, handler: viewModel.getArticles)
            case .success(content: let articles):
                NavigationView {
                    List(articles) { item in
                        ArticleView( article: item )
                            .onTapGesture {
                                load(url: item.url)
                            }
                    }
                    .navigationTitle(Text("iNews"))
                }
                
            }
        }
        .onAppear(perform: viewModel.getArticles)
        
    }
    
    func load(url: String? ) {
        guard let link = url,
              let url = URL(string: link) else {return}
        
        openURL(url)
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
