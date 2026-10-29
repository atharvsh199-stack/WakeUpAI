

import SwiftUI

@main
struct WakeUpAIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State private var alarmTime = Calendar.current.date(
        from: DateComponents(hour: 9, minute: 0)
    ) ?? Date()

    @State private var songName = ""
    @State private var stopPhrase = "uth gaya hu"
    @State private var repeatDays: Set<Int> = [1, 2, 3, 4, 5]
    @State private var saved = false

    private let days = ["S", "M", "T", "W", "T", "F", "S"]

    var body: some View {
        ZStack {
            Color(red: 0.04, green: 0.05, blue: 0.09)
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    HStack {
                        Image(systemName: "alarm.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.cyan)

                        Text("WakeUp AI")
                            .font(.largeTitle.bold())
                            .foregroundStyle(.white)
                    }

                    Text("Your morning. Your music.")
                        .foregroundStyle(.gray)

                    VStack(alignment: .leading, spacing: 12) {
                        Text("ALARM TIME")
                            .font(.caption.bold())
                            .foregroundStyle(.cyan)

                        DatePicker(
                            "Wake-up time",
                            selection: $alarmTime,
                            displayedComponents: .hourAndMinute
                        )
                        .datePickerStyle(.wheel)
                        .colorScheme(.dark)
                    }
                    .padding()
                    .background(.white.opacity(0.06))
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                    VStack(alignment: .leading, spacing: 14) {
                        Text("REPEAT")
                            .font(.caption.bold())
                            .foregroundStyle(.cyan)

                        HStack(spacing: 8) {
                            ForEach(0..<7, id: \.self) { day in
                                Button {
                                    if repeatDays.contains(day) {
                                        repeatDays.remove(day)
                                    } else {
                                        repeatDays.insert(day)
                                    }
                                } label: {
                                    Text(days[day])
                                        .frame(
                                            maxWidth: .infinity,
                                            minHeight: 42
                                        )
                                        .background(
                                            repeatDays.contains(day)
                                            ? Color.cyan
                                            : Color.white.opacity(0.1)
                                        )
                                        .foregroundStyle(
                                            repeatDays.contains(day)
                                            ? Color.black : Color.white
                                        )
                                        .clipShape(Circle())
                                }
                            }
                        }
                    }
                    .padding()
                    .background(.white.opacity(0.06))
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                    VStack(alignment: .leading, spacing: 12) {
                        Text("YOUR WAKE-UP SONG")
                            .font(.caption.bold())
                            .foregroundStyle(.cyan)

                        TextField(
                            "Song or singer name",
                            text: $songName
                        )
                        .textFieldStyle(.roundedBorder)

                        Text("STOP PHRASE")
                            .font(.caption.bold())
                            .foregroundStyle(.cyan)

                        TextField(
                            "Example: uth gaya hu",
                            text: $stopPhrase
                        )
                        .textFieldStyle(.roundedBorder)
                    }
                    .padding()
                    .background(.white.opacity(0.06))
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                    Button {
                        saved = true
                    } label: {
                        Label("Save Alarm", systemImage: "checkmark.circle.fill")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.cyan)
                            .foregroundStyle(.black)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    }

                    if saved {
                        Text("Settings saved in this screen. Alarm scheduling and music playback are not implemented yet.")
                            .font(.footnote)
                            .foregroundStyle(.orange)
                    }

                    Text("Wake up smarter.")
                        .font(.caption)
                        .foregroundStyle(.gray)
                        .frame(maxWidth: .infinity)
                }
                .padding()
            }
        }
        .preferredColorScheme(.dark)
    }
}
