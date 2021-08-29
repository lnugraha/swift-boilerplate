//
//  widget_api_extensions.swift
//  widget_api_extensions
//
//  Created by Leo Nugraha on 2021/8/26.
//

import WidgetKit
import SwiftUI
import Intents

struct widget_api_extension_provider: TimelineProvider {

//    func getTimeline(in context: Context, completion: @escaping (Timeline<widget_api_extension_entry>) -> ()) {
//        var entries: [widget_api_extension_entry] = []
//        var policy: TimelineReloadPolicy = .atEnd
//
//        let entry = widget_api_extension_entry(date: Date(), image: UIImage(named: "Placeholder")!)
//        entries.append(entry)
//
//        let timeline = Timeline(entries: entries, policy: policy)
//        completion(timeline)
//    }
    
    func placeholder(in context: Context) -> widget_api_extension_entry {
        widget_api_extension_entry(date: Date(), image: UIImage(named: "Placeholder")!)
    }

    func getSnapshot(in context: Context, completion: @escaping (widget_api_extension_entry) -> ()) {
        let entry = widget_api_extension_entry(date: Date(), image: UIImage(named: "Placeholder")!)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        
//        widget_api_image_provider.getImageFromApi() { _ in
//            
//        }
        
        var entries: [widget_api_extension_entry] = []
        var policy: TimelineReloadPolicy = .atEnd

        let entry = widget_api_extension_entry(date: Date(), image: UIImage(named: "Placeholder")!)
        entries.append(entry)

        let timeline = Timeline(entries: entries, policy: policy)
        completion(timeline)
    }
}


struct widget_api_extension_entry: TimelineEntry {
    let date: Date
    let image: UIImage
}

struct widget_api_extensionsEntryView : View {
    var entry: widget_api_extension_provider.Entry

    var body: some View {
//        Text(entry.date, style: .time)
        Image(uiImage: entry.image)
            .resizable()
            .scaledToFill()
    }
}

@main
struct widget_api_extensions: Widget {
    let kind: String = "widget_api_extensions"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: widget_api_extension_provider()) { entry in
            widget_api_extensionsEntryView(entry: entry)
        }
        .configurationDisplayName("Astronomy picture of the day")
        .description("This is a widget that shows the astronomy picture of the day")
    }
}

struct widget_api_extensions_Previews: PreviewProvider {
    static var previews: some View {
        widget_api_extensionsEntryView(entry: widget_api_extension_entry(date: Date(), image: UIImage(named: "Placeholder")!))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
