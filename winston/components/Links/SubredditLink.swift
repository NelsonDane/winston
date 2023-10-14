//
//  SubredditLink.swift
//  winston
//
//  Created by Igor Marcossi on 11/07/23.
//

import SwiftUI
import Defaults

struct SubredditLinkContainer: View {
  var noHPad = false
  @StateObject var sub: Subreddit
  var body: some View {
    SubredditLink(noHPad: true, sub: sub)
  }
}

struct SubredditLink: View {
  var noHPad = false
  var sub: Subreddit
  @State var opened = false
  @EnvironmentObject private var routerProxy: RouterProxy
  var body: some View {
    if var data = sub.data {
      @State var isSubbed = data.user_is_subscriber ?? false
      HStack(spacing: 12) {
        SubredditIcon(data: data, size: 64)
          .nsfw(Defaults[.blurPostLinkNSFW] ? data.over18 ?? false : false, smallIcon: true)
        
        VStack(alignment: .leading) {
          Text("r/\(data.display_name ?? "?")")
            .fontSize(18, .semibold)
          Text("\(formatBigNumber(data.subscribers ?? 0)) subscribers")
            .fontSize(14).opacity(0.5)
          Text((data.public_description).md()).lineLimit(2)
            .fontSize(15).opacity(0.75)
        }
        
        Spacer()
        (data.user_is_subscriber ?? false ? Label("Subscribe", systemImage:"checkmark" ) : nil)
          .labelStyle(.iconOnly)
          .foregroundColor(.accentColor)
      }
      .padding(.horizontal, noHPad ? 0 : 16)
      .padding(.vertical, 14)
      .frame(maxWidth: .infinity, alignment: .leading)
      .themedListRowBG(disableBG: noHPad)
      .mask(RR(20, .black))
      .onTapGesture {
        routerProxy.router.path.append(SubViewType.posts(sub))
      }
    }
  }
}

//struct SubredditLink_Previews: PreviewProvider {
//    static var previews: some View {
//        SubredditLink()
//    }
//}
