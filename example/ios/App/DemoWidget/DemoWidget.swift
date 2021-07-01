//
//  DemoWidget.swift
//  DemoWidget
//
//  Created by Mustafa on 20/11/1442 AH.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), text: nil, configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), text: nil, configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        let sharedDefaults = UserDefaults.init(suiteName: "group.com.capacitorjs.demo")
        var data: String? = nil
        
        if(sharedDefaults != nil) {
            data = sharedDefaults?.string(forKey: "demo")
        }

        let currentDate = Date()
        let entryDate = Calendar.current.date(byAdding: .minute, value: 5, to: currentDate)!
        let entry = SimpleEntry(date: entryDate, text: data, configuration: configuration)
        entries.append(entry)

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let text: String?
    let configuration: ConfigurationIntent
}

struct DemoWidgetEntryView : View {
    var entry: Provider.Entry

    
    var body: some View {
        Text(entry.text ?? "Not Set")
    }
}

@main
struct DemoWidget: Widget {
    let kind: String = "DemoWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            DemoWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct DemoWidget_Previews: PreviewProvider {
    static var previews: some View {
        DemoWidgetEntryView(entry: SimpleEntry(date: Date(), text: nil, configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
