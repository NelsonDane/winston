//
//  migrateOldDefaults.swift
//  winston
//
//  Created by Igor Marcossi on 15/12/23.
//

import Foundation
import Defaults

func migrateOldDefaults() {
  guard !Defaults[.wereOldDefaultsMigrated] else { return }
  var newPostLinkDefSettings = PostLinkDefSettings(
    compactMode: .init(
      enabled: Defaults[._compactMode],
      thumbnailSize: Defaults[._compThumbnailSize],
      thumbnailSide: Defaults[._thumbnailPositionRight] ? .trailing : .leading,
      voteButtonsSide: Defaults[._voteButtonPositionRight] ? .trailing : .leading,
      showPlaceholderThumbnail: Defaults[._showSelfPostThumbnails]
    ),
    showAuthor: Defaults[._showAuthorOnPostLinks],
    swipeActions: Defaults[._postSwipeActions],
    showVotesCluster: Defaults[._showVotes],
    showUpVoteRatio: Defaults[._showUpvoteRatio],
    blurNSFW: Defaults[._blurPostLinkNSFW],
    isMediaTappable: Defaults[._tappableFeedMedia],
    showSelfText: Defaults[._showSelfText],
    enableVotesPopover: Defaults[._enableVotesPopover],
    maxMediaHeightScreenPercentage: Defaults[._maxPostLinkImageHeightPercentage],
    readOnScroll: Defaults[._readPostOnScroll],
    lightboxReadsPost: Defaults[._lightboxViewsPost],
    dividerPosition: Defaults[._showSubsAtTop] ? .top : .bottom,
    titlePosition: Defaults[._showTitleAtTop] ? .top : .bottom,
    hideOnRead: Defaults[._hideReadPosts]
  )
  var newVideoDefSettings = VideoDefSettings(
    autoPlay: Defaults[._autoPlayVideos],
    mute: Defaults[._muteVideos],
    pauseBGAudioOnFullscreen: Defaults[._pauseBackgroundAudioOnFullscreen],
    loop: Defaults[._loopVideos]
  )
  var newAppearanceDefSettings = AppearanceDefSettings(
    replyModalBlurBackground: Defaults[._replyModalBlurBackground],
    newPostModalBlurBackground: Defaults[._newPostModalBlurBackground],
    showUsernameInTabBar: Defaults[._showUsernameInTabBar],
    disableAlphabetLettersSectionsInSubsList: Defaults[._disableAlphabetLettersSectionsInSubsList],
    themeStoreTint: Defaults[._themeStoreTint],
    shinyTextAndButtons: Defaults[._shinyTextAndButtons]
  )
  var newBehaviorDefSettings = BehaviorDefSettings(
    openYoutubeApp: Defaults[._openYoutubeApp],
    openLinksInSafari: Defaults[._openLinksInSafari],
    enableSwipeAnywhere: Defaults[._enableSwipeAnywhere],
    preferenceDefaultFeed: Defaults[._preferenceDefaultFeed],
    doLiveText: Defaults[._doLiveText],
    iCloudSyncCredentials: Defaults[._syncKeyChainAndSettings]
  )
  var newGeneralDefSettings = GeneralDefSettings(
    redditCredentialSelectedID: Defaults[._redditCredentialSelectedID],
    redditAPIUserAgent: Defaults[._redditAPIUserAgent],
    lastSeenAnnouncementTimeStamp: Defaults[._lastSeenAnnouncementTimeStamp],
    useAuth: Defaults[._useAuth],
    showingUpsellDict: Defaults[._showingUpsellDict]
  )
  var newSubredditFeedDefSettings = SubredditFeedDefSettings(
    preferredSort: Defaults[._preferredSort],
    preferredSearchSort: Defaults[._preferredSearchSort],
    compactPerSubreddit: Defaults[._compactPerSubreddit],
    chunkLoadSize: Defaults[._feedPostsLoadLimit],
    perSubredditSort: Defaults[._perSubredditSort],
    subredditSorts: Defaults[._subredditSorts]
  )
  var newCommentLinkDefSettings = CommentLinkDefSettings(
    swipeActions: Defaults[._commentSwipeActions],
    coloredNames: Defaults[._coloredCommentNames]
  )
  var newCommentsSectionDefSettings = CommentsSectionDefSettings(
    collapseAutoModerator: Defaults[._collapseAutoModerator],
    preferredSort: Defaults[._preferredCommentSort]
  )
  var newPostPageDefSettings = PostPageDefSettings(
    blurNSFW: Defaults[._blurPostNSFW],
    preferredSearchSort: Defaults[._preferredSearchSort],
    perPostSort: Defaults[._perPostSort],
    postSorts: Defaults[._postSorts],
    showUpVoteRatio: Defaults[._showUpvoteRatio]
  )
  var newThemesDefSettings = ThemesDefSettings(
    themesPresets: Defaults[._themesPresets],
    selectedThemeID: Defaults[._selectedThemeID]
  )
  
  resetPreferences()
  
  Defaults[.PostLinkDefSettings] = newPostLinkDefSettings
  Defaults[.VideoDefSettings] = newVideoDefSettings
  Defaults[.AppearanceDefSettings] = newAppearanceDefSettings
  Defaults[.BehaviorDefSettings] = newBehaviorDefSettings
  Defaults[.GeneralDefSettings] = newGeneralDefSettings
  Defaults[.SubredditFeedDefSettings] = newSubredditFeedDefSettings
  Defaults[.CommentLinkDefSettings] = newCommentLinkDefSettings
  Defaults[.CommentsSectionDefSettings] = newCommentsSectionDefSettings
  Defaults[.PostPageDefSettings] = newPostPageDefSettings
  Defaults[.ThemesDefSettings] = newThemesDefSettings
  Defaults[.wereOldDefaultsMigrated] = true
}
             