//
//  alertzzzWidget.swift
//  alertzzzWidget
//
//  Created by Varun Sharma on 20/02/26.
//

import WidgetKit
import SwiftUI

// MARK: - Timeline Entry

struct SimpleEntry: TimelineEntry {
    let date: Date
    let myStatus: String
}

// MARK: - Provider

struct Provider: TimelineProvider {
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), myStatus: "Free")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        completion(loadEntry())
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entry = loadEntry()
        
        // Refresh every 15 minutes
        let nextUpdate = Calendar.current.date(byAdding: .minute, value: 15, to: Date())!
        let timeline = Timeline(entries: [entry], policy: .after(nextUpdate))
        
        completion(timeline)
    }
    
    private func loadEntry() -> SimpleEntry {
        let defaults = UserDefaults(suiteName: "group.com.alertzzz")
        let status = defaults?.string(forKey: "myStatus") ?? "Free"
        
        return SimpleEntry(date: Date(), myStatus: status)
    }
}

// MARK: - Widget View

struct alertzzzWidgetEntryView: View {
    var entry: Provider.Entry

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Text("alertzzz")
                .font(.caption)
                .foregroundStyle(.secondary)
            
            Text("You are")
                .font(.caption2)
                .foregroundStyle(.secondary)

            Text(entry.myStatus)
                .font(.title2)
                .bold()
            
            Spacer()
            
            HStack(spacing: 6) {
                Image(systemName: icon(for: entry.myStatus))
                Text(statusMessage(for: entry.myStatus))
                    .font(.caption2)
            }
            .foregroundStyle(.secondary)
        }
        .padding()
    }
    
    private func icon(for status: String) -> String {
        switch status {
        case "Free":
            return "checkmark.circle.fill"
        case "Working":
            return "briefcase.fill"
        case "Sleeping":
            return "moon.fill"
        default:
            return "person.fill"
        }
    }
    
    private func statusMessage(for status: String) -> String {
        switch status {
        case "Free":
            return "Available for alerts"
        case "Working":
            return "Focus mode"
        case "Sleeping":
            return "Do not disturb"
        default:
            return ""
        }
    }
}

// MARK: - Widget Configuration

struct alertzzzWidget: Widget {
    let kind: String = "alertzzzWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                alertzzzWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                alertzzzWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("Your Status")
        .description("See your current alertzzz status instantly.")
        .supportedFamilies([.systemSmall])
    }
}

// MARK: - Preview

#Preview(as: .systemSmall) {
    alertzzzWidget()
} timeline: {
    SimpleEntry(date: .now, myStatus: "Free")
    SimpleEntry(date: .now, myStatus: "Working")
}
