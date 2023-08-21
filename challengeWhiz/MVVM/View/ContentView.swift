//
//  ContentView.swift
//  challengeWhiz
//
//  Created by Jimmy Ronaldo Macedo Pizango on 19/08/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView{
            VStack{
                HeaderImageView()
                HeaderTextView()
                ShowMoreButtonView()
                Spacer()
            }
            .navigationTitle("")
        }
    }
}

struct HeaderImageView: View {
    var body: some View {
        Image(NameImageDefault.presentation.rawValue)
            .resizable()
            .scaledToFit()
            .frame(width: 350, height: 400)
    }
}

struct HeaderTextView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Buscas los mejores Productos?")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.bottom, 8)
            
            Text("Tenemos los mejores productos y los mejores precios")
                .foregroundColor(.gray)
                .frame(alignment: .leading)
                .padding(.bottom, 40)
        }
    }
}

struct ShowMoreButtonView: View {
    var body: some View {
        NavigationLink(destination: ListView()){
            Text("Ver productos")
                .padding(.horizontal, 40)
                .padding()
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .background(Color.primaryColor)
                .cornerRadius(10)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
