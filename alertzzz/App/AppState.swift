import Observation

@Observable
final class AppState {

    // Current user
    var currentSelf = Friend(name: "Varun", status: .free)

    // Other friends
    var friends: [Friend] = [
        Friend(name: "Ethan", status: .free),
        Friend(name: "James", status: .sleeping),
        Friend(name: "Liam", status: .free),
        Friend(name: "Noah", status: .working),
        Friend(name: "William", status: .sleeping)
    ]

    var statusMessage: String = ""
}
