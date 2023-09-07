//
//  ErrorView.swift
//  iNEWs
//
//  Created by Paulo Pinheiro on 9/7/23.
//

import SwiftUI

struct ErrorView: View {
    
    internal init(error: Error,
                  handler: @escaping ErrorView.ErrorViewActionHandler) {
        self.error = error
        self.handler = handler
    }
    
    typealias ErrorViewActionHandler = () -> Void
    
    let error: Error
    let handler: ErrorViewActionHandler
    
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.icloud.fill")
                .foregroundColor(.gray)
                .font(.system(size: 50, weight: .heavy))
                .padding(.bottom)
            Text("Ooops")
                .foregroundColor(.gray)
                .font(.system(size: 25, weight: .heavy))
            Text(error.localizedDescription)
                .foregroundColor(.gray)
                .font(.system(size:15))
                .multilineTextAlignment(.center)
                .padding(.vertical, 4)
            Button(action: {
                handler()
            }, label: {
                Text("Retry")
            })
                    .padding(.vertical, 12)
                    .padding(.horizontal, 30)
                    .foregroundColor(.white)
                    .background(Color.gray)
                    .font(.system(size: 15, weight: .heavy))
                    .cornerRadius(10)
                
                    
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: APIError.decodingError) {}
            .previewLayout(.sizeThatFits)
    }
}
