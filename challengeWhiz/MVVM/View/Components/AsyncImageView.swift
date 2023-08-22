//
//  AsyncImageView.swift
//  challengeWhiz
//
//  Created by Jimmy Ronaldo Macedo Pizango on 20/08/23.
//

import SwiftUI


struct AsyncImageView: View {
    let url: URL?
    let size: CGSize?
    
    init(url: URL?, size: CGSize? = nil) {
        self.url = url
        self.size = size
        
    }
    
    var body: some View {
        if let url = url {
            loadImageFromURL(url: url)
        }
    }

    private func loadImageFromURL(url: URL) -> some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: size?.width, height: size?.height)
            case .failure(_):
                failureView()
            case .empty:
                placeholderView()
            @unknown default:
                EmptyView()
            }
        }
    }
    private func showPlaceholderImage() -> some View {
        placeholderView()
    }
    
    private func placeholderView() -> some View {
        Image(NameImageDefault.placeholder.rawValue)
            .resizable()
            .scaledToFit()
            .frame(width: size?.width, height: size?.height)
    }
    
    private func failureView() -> some View {
        Image(NameImageDefault.empty.rawValue)
            .resizable()
            .scaledToFit()
            .frame(width: size?.width, height: size?.height)
    }
}

struct AsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageView(url: URL(string: "https://example.com/image.jpg"), size: CGSize(width: 100, height: 100))
            .previewLayout(.fixed(width: 200, height: 200)) // Ajusta el tamaño del preview según tus necesidades
    }
}



