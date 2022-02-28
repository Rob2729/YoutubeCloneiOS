//
//  ContentView.swift
//  YoutubeUI
//
//  Created by Robert on 20/02/2022.
//

import SwiftUI

let bgColor = Color(#colorLiteral(red: 0.1285863519, green: 0.1285863519, blue: 0.1285863519, alpha: 1))

struct ContentView: View {
    
    let videos = [
        Video(title: "Spotify Clone", thumbnail: "spotifyclone", profileImage: "profileImage", userName: "developer_rob", views: 5, postedDate: "2 weeks ago"),
        Video(title: "Facebook Clone ", thumbnail: "facebookclone", profileImage: "profileImage", userName: "developer_rob", views: 5, postedDate: "3 weeks ago"),
        Video(title: "Twitter Clone ", thumbnail: "twitterclone", profileImage: "profileImage", userName: "developer_rob", views: 5, postedDate: "3 weeks ago"),
        Video(title: "SwiftUI tutorial", thumbnail: "SwiftUI", profileImage: "profileImage", userName: "developer_rob", views: 5, postedDate: "3 weeks ago"),
        Video(title: "iPad Pro review", thumbnail: "ipadPro", profileImage: "profileImage", userName: "developer_rob", views: 5, postedDate: "10 weeks ago"),
    ]
    
    var body: some View {
        ZStack {
            bgColor
                .ignoresSafeArea()
            VStack(spacing: 0) {
                ScrollView {
                    Header()
                    LineDivider()
                        .foregroundColor(.white)
                    Topics()
                    LineDivider()
                    ForEach(0..<videos.count) { i in
                        Videos(video: videos[i])
                    }
                }
                BottomNavBar()
            }
            
        }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Header : View {
    var body: some View {
        HStack(alignment: .center,spacing: 20) {
            Image("YTLogo")
                .resizable()
                .frame(width: 160, height: 30)
            
            Spacer()
            
            Group {
                Image(systemName: "airplayvideo")
                Image(systemName: "bell")
                Image(systemName: "magnifyingglass")
                Image("profileImage")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 30, height: 30)
                    .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 10))
            }
            .foregroundColor(.white)
            .font(.system(size: 20))
            
        }
    }
}

struct LineDivider : View {
    var body : some View {
        Rectangle()
            .frame(width: UIScreen.main.bounds.width, height: 1)
            .foregroundColor(.white)
            .opacity(0.1)
            .padding(0)
    }
}

struct Topics : View {
    let topics = ["All", "SwiftUI", "Apple", "Computer Science", "Software Development", "iPad"]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(0..<topics.count) { i in
                    Button {
                        print("Pressed!")
                    } label: {
                        Text(topics[i])
                            .foregroundColor(i == 0 ? Color.black : Color.white)
                            .padding(EdgeInsets(top: 7, leading: 15, bottom: 7, trailing: 15))
                            .background(i == 0 ? Color.white : Color(#colorLiteral(red: 0.2089576423, green: 0.2147817016, blue: 0.2194771767, alpha: 1)))
                            .clipShape(Capsule())
                    }
                }
                
            }
        }
        .padding(.init(top: 6, leading: 6, bottom: 6, trailing: 0))
    }
}

struct Video {
    var title : String
    var thumbnail : String
    var profileImage : String
    var userName : String
    var views : Int
    var postedDate : String
    
}

struct Videos : View {
    let video : Video
    
    var body: some View {
        VStack {
            Image(video.thumbnail)
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: 250)
                .aspectRatio( contentMode: .fit)
            HStack {
                VStack(alignment: .leading){
                    Image(video.profileImage)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .padding(.init(top: 5, leading: 15, bottom: 5, trailing: 5))
                }
                VStack(alignment: .leading, spacing:1) {
                    HStack {
                        Text(video.title)
                            .font(.subheadline)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Image(systemName: "ellipsis")
                            .foregroundColor(.white)
                            .rotationEffect(.degrees(90))
                            .font(.subheadline)
                    }
                    
                    HStack(spacing: 5) {
                        Text(video.userName)
                            .font(.caption2)
                            .foregroundColor(.gray)
                        
                        Circle()
                            .frame(width: 2, height: 2)
                            .foregroundColor(.gray)
                        
                        Text("\(video.views) views")
                            .font(.caption2)
                            .foregroundColor(.gray)
                        
                        Circle()
                            .frame(width: 2, height: 2)
                            .foregroundColor(.gray)
                        
                        Text(video.postedDate)
                            .font(.caption2)
                            .foregroundColor(.gray)
                        
                        
                    }
                    
                    
                    
                }
                Spacer()
                
            }
            
        }
        .padding(.init(top: 0, leading: 0, bottom: 15, trailing: 0))
    }
}


struct BottomNavBar : View {
    var body : some View {
        VStack(spacing: 12) {
            LineDivider()
            HStack(spacing: 20){
                
                VStack {
                    Image(systemName: "house.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                    Text("Home")
                        .font(.system(size: 7))
                        .foregroundColor(.white)
                }
                Spacer()
                VStack {
                    Image(systemName: "safari")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                    Text("Explore")
                        .font(.system(size: 7))
                        .foregroundColor(.white)
                }
                Spacer()
                HStack(spacing:5) {
                    VStack(alignment: .leading) {
                        Image(systemName: "plus.circle")
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                        Text("")
                        
                    }
                }
                
                Spacer()
                VStack {
                    Image(systemName: "play.rectangle.on.rectangle")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                    Text("Subscriptions")
                        .font(.system(size: 7))
                        .foregroundColor(.white)
                }
                Spacer()
                VStack {
                    Image(systemName: "rectangle.stack.badge.play")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                    Text("Home")
                        .font(.system(size: 7))
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal)
        }
    }
}


