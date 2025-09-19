import UIKit

// TV show properties
struct TVShow {
    var name: String
    var summary: String
    var year: Int?
    var cast: [String]
    var country: String
    var genreList: [String]
    var episodesBySeason: [Int: [Int: String]]
    }

// description of properties
var showInfo = TVShow(
    name: "The Dick Van Dyke Show",
    summary: "The Dick Van Dyke Show centers around the work and home life of television comedy writer Rob Petrie. The plots generally revolve around problems at work, where Rob got into various comedic jams with fellow writers Buddy Sorrell, Sally Rogers and producer Mel Cooley.",
    year: 1990,
    cast: ["Dick Van Dyke", "Rose Marie", "Morey Amsterdam", "Larry Mathews", "Mary Tyler Moore", "Richard Deacon", "Ann Morgan Guilbert", "Frank Adamo", "Jerry Paris", "Carl Reiner"],
    country: "United States",
    genreList: ["Comedy", "Family"],
    episodesBySeason: [
        1: [
            1: "The Sick Boy and the Sitter",
            2: "My Blonde-Haired Brunette",
            3: "Sally and the Lab Technician",
            4: "Washington vs. the Bunny",
            5: "Oh How We Met on the Night That We Danced",
            6: "Harrison B. Harding of Camp Crowder, Mo.",
            7: "Jealousy!",
            8: "To Tell or Not to Tell",
            9: "The Unwelcome Houseguest",
            10: "The Meershatz Pipe",
            11: "Forty-Four Tickets",
            12: "Empress Carlotta's Necklace",
            13: "Sally is a Girl",
            14: "Buddy, Can You Spare a Job?",
            15: "Where Did I Come From?",
            16: "The Curious Thing About Women",
            17: "Punch Thy Neighbor",
            18: "Who Owes Who What?",
            19: "The Talented Neighborhood",
            20: "A Word a Day",
            21: "The Boarder Incident",
            22: "Father of the Week",
            23: "The Twizzle",
            24: "One Angry Man",
            25: "Where You Been, Fassbinder?",
            26: "I Am My Brother's Keeper",
            27: "The Sleeping Brother",
            28: "The Bad Old Days",
            29: "Sol and the Sponsor",
            30: "The Return of Happy Spangler",
        ],
        2: [
            1: "Never Name a Duck",
            2: "The Two Faces of Rob",
            3: "The Attempted Marriage",
            4: "Bank Book 6565696",
            5: "Hustling the Hustler",
            6: "My Husband is Not a Drunk",
            7: "What's in a Middle Name?",
            8: "Like a Sister",
            9: "The Night the Roof Fell In",
            10: "The Secret Life of Buddy and Sally",
            11: "A Bird in the Head Hurts",
            12: "Gesundheit, Darling",
            13: "A Man's Teeth Are Not His Own",
            14: "Somebody Has to Play Cleopatra",
            15: "The Cat Burglar",
            16: "The Foul Weather Girl",
            17: "Will You Two Be My Wife?",
            18: "Ray Murdock's X-Ray",
            19: "I Was a Teenage Head Writer",
            20: "It May Look Like a Walnut",
            21: "My Husband is a Check-Grabber",
            22: "Don't Trip Over That Mountain",
            23: "Give Me Your Walls!",
            24: "The Sam Pomerantz Scandals",
            25: "The Square Triangle",
            26: "I'm No Henry Walden!",
            27: "Racy Tracy Rattigan",
            28: "Divorce",
            29: "It's a Shame She Married Me",
            30: "A Surprise Surprise is a Surprise",
            31: "Jilting the Jilter",
            32: "When a Bowling Pin Talks, Listen",
        ]
    ],)

//*************************CAST*************************//

//>>>sorting>>>
// print cast list ascending
print("CAST LIST ASCENDING:")
for cast in showInfo.cast.sorted(by: <) {
    print("\(cast)")
}

// print cast list descending
print("\nCAST LIST DESCENDING:")
for cast in showInfo.cast.sorted(by: >) {
    print("\(cast)")
}

//>>>append>>>
// assorted append functions
showInfo.cast.append("Johnny Silver") // adds 1 item at end of list
showInfo.cast.insert("Allan Melvin", at: 8) // add cast with index num
showInfo.cast += ["Amzie Strickland", "Howard Wendell"] // adds multiple items at end of list

print("\n\(showInfo.cast.count)")
print(showInfo.cast)

//>>>remove & replace>>>
// remove
var removedLastCast = showInfo.cast.removeLast() // removes last item
print("\n\(removedLastCast) was removed")
print(showInfo.cast)
print("/(showInfo.cast.count) cast members")

var removedCastMember: String = showInfo.cast.remove(at: 3) // removes item by index num
print("\n\(removedCastMember) was removed")
print(showInfo.cast)
print("/(showInfo.cast.count) cast members")

var removedCast: String = showInfo.cast.remove(at: 4) // stores removed cast name in a new variable
print("\n\(removedCast) was removed")
print(showInfo.cast)
print("/(showInfo.cast.count) cast members")

// replace
showInfo.cast [1] = "Tiny Brauer" // replaces given index num with passed value
print("\n\(showInfo.cast)")
print("\(showInfo.cast.count) cast members\n")


var replacedCastWithIndex = showInfo.cast // stores updated cast array in a new variable
replacedCastWithIndex[1] = "Herbie Faye"
print(replacedCastWithIndex.count)
print("\(replacedCastWithIndex)\n")
/*print(showInfo.cast)*/

// prints old & new values with error handling
let index = 0
if showInfo.cast.indices.contains(index) {
    let oldValue = showInfo.cast[index]
    let newValue = "Tiny Brauer"
    showInfo.cast[index] = newValue
    print("Replaced '\(oldValue)' with '\(newValue)' at index \(index)")
    print(showInfo.cast)
} else {
    print("Index \(index) is out of range.")
}

// print cast in list form
print("\nCast:")
for person in showInfo.cast {
    print("• \(person)")
}

//*************************EPISODE*************************//

//  printEpisodeDetails
extension TVShow {
    func printEpisodeTitle(season: Int, episode: Int) {
        let title = episodesBySeason[season]?[episode] ?? "Not Found!"
        print("\(title)\n")
    }
}

print("\nEpisode Search:")
showInfo.printEpisodeTitle(season: 1, episode: 18)

// all seasons, ordered
for season in showInfo.episodesBySeason.keys {
    print("\nSeason \(season)")
    if let eps = showInfo.episodesBySeason[season] {
        for ep in eps.keys.sorted(by:>) {
            if let title = eps[ep] {
                print("S\(season)E\(ep): \(title)")
                //print("  E\(ep): \(title)")
            }
        }
    }
}
//*************************OTHER*************************//

// output TV show properties
print("\nTitle: \(showInfo.name)")
print("\nSummary: \(showInfo.summary)")

let releaseDate = showInfo.year.map(String.init) ?? "Unknown"
print("\nYear: \(releaseDate)")

print("\nCountry: \(showInfo.country)")
