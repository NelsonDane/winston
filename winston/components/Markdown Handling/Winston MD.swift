//
//  Winston MD.swift
//  winston
//
//  Created by Ethan Bills on 1/12/24.
//

import SwiftUI
import MarkdownUI

extension Theme {
  /// Winston Markdown theme.
  public static func winstonMarkdown(fontSize: CGFloat, lineSpacing: CGFloat = 0.2, textSelection: Bool = false) -> Theme {
    let theme = Theme()
      .text {
        FontSize(fontSize)
      }
      .paragraph { configuration in
        configuration.label
          .relativeLineSpacing(.em(lineSpacing))
          .fontSize(fontSize)
          .textSelection(WinstonTextSelectability(allowsSelection: textSelection))
      }
      .heading1 { configuration in
        configuration.label
          .markdownTextStyle {
            FontSize(fontSize * 2)
          }
          .textSelection(WinstonTextSelectability(allowsSelection: textSelection))
      }
      .heading2 { configuration in
        configuration.label
          .markdownTextStyle {
            FontSize(fontSize * 1.5)
          }
          .textSelection(WinstonTextSelectability(allowsSelection: textSelection))
      }
      .heading3 { configuration in
        configuration.label
          .markdownTextStyle {
            FontSize(fontSize * 1.25)
          }
          .textSelection(WinstonTextSelectability(allowsSelection: textSelection))
      }
      .listItem { configuration in
        configuration.label
          .markdownMargin(top: .em(0.3))
          .textSelection(WinstonTextSelectability(allowsSelection: textSelection))
      }
      .codeBlock { configuration in
        configuration.label
          .markdownTextStyle {
            FontSize(.em(0.85))
          }
          .padding()
          .background(Color(.secondarySystemBackground))
          .clipShape(RoundedRectangle(cornerRadius: 8))
          .markdownMargin(top: .zero, bottom: .em(0.8))
          .textSelection(WinstonTextSelectability(allowsSelection: textSelection))
      }
    return theme
  }
}

struct WinstonTextSelectability: TextSelectability {
  let allowsSelection: Bool
  
  init(allowsSelection: Bool) {
    self.allowsSelection = allowsSelection
  }
  
  static var allowsSelection: Bool {
    return true
  }
}
