////
////  Data.swift
////  Kinopoisk
////
////  Created by Olzhas Seiilkhanov on 19.05.2022.
////
//
//import UIKit
//
//struct RawData {
//    var genres: [Genre] = [
//        Genre.init(text: "All"),
//        Genre.init(text: "Comedy"),
//        Genre.init(text: "Action"),
//        Genre.init(text: "Drama"),
//        Genre.init(text: "Adventure"),
//        Genre.init(text: "Sci-fi")
//    ]
//
//    var sections: [String] = [
//        "Today at the cinema",
//        "Soon at the cinema",
//        "Trending movies"
//    ]
//
//    var movies: [Movie] = [
//        Movie.init(title: "Sonic the Hedgehog", releaseDate: "2020-02-14", voteAverage: "★8.7", posterPatch: UIImage.init(named: "sonic.jpeg"), details: "The world needed a hero -- it got a hedgehog. Powered with incredible speed, Sonic embraces his new home on Earth -- until he accidentally knocks out the power grid, sparking the attention of uncool evil genius Dr. Robotnik. Now, it's supervillain vs. supersonic in an all-out race across the globe to stop Robotnik from using Sonic's unique power to achieve world domination. The world needed a hero -- it got a hedgehog. Powered with incredible speed, Sonic embraces his new home on Earth -- until he accidentally knocks out the power grid, sparking the attention of uncool evil genius Dr. Robotnik. Now, it's supervillain vs. supersonic in an all-out race across the globe to stop Robotnik from using Sonic's unique power to achieve world domination.", poster: UIImage.init(named: "sonic_cover.jpeg"), actors: [
//            Cast.init(name: "James\nMarsden", status: "Acting", image: UIImage(named: "james.jpeg"), birthday: "Sep 18, 1973", biography: "Handsome leading man and former Versace model James Marsden emerged as one of a batch of attractive young actors in the late-1990s that surprised both critics and audiences with a string of diverse, comedic performances a decade later. After appearing in a production of \"Bye Bye Birdie\" in college, Marsden began making guest appearances on popular series that included \"The Nanny\" (CBS, 1993-2000), \"Blossom\" (NBC, 1990-95) and \"Party of Five\" (Fox, 1994-2000). Handsome leading man and former Versace model James Marsden emerged as one of a batch of attractive young actors in the late-1990s that surprised both critics and audiences with a string of diverse, comedic performances a decade later. After appearing in a production of \"Bye Bye Birdie\" in college, Marsden began making guest appearances on popular series that included \"The Nanny\" (CBS, 1993-2000), \"Blossom\" (NBC, 1990-95) and \"Party of Five\" (Fox, 1994-2000). Handsome leading man and former Versace model James Marsden emerged as one of a batch of attractive young actors in the late-1990s that surprised both critics and audiences with a string of diverse, comedic performances a decade later. After appearing in a production of \"Bye Bye Birdie\" in college, Marsden began making guest appearances on popular series that included \"The Nanny\" (CBS, 1993-2000), \"Blossom\" (NBC, 1990-95) and \"Party of Five\" (Fox, 1994-2000)."),
//            Cast.init(name: "Jim\nCarrey", status: "Acting", image: UIImage(named: "jim.jpeg"), birthday: "January 17, 1962", biography: "James Eugene Carrey is a Canadian and American actor and comedian. Known for his energetic slapstick performances, Carrey first gained recognition in 1990, after landing a recurring role in the American sketch comedy television series In Living Color. James Eugene Carrey is a Canadian and American actor and comedian. Known for his energetic slapstick performances, Carrey first gained recognition in 1990, after landing a recurring role in the American sketch comedy television series In Living Color. James Eugene Carrey is a Canadian and American actor and comedian. Known for his energetic slapstick performances, Carrey first gained recognition in 1990, after landing a recurring role in the American sketch comedy television series In Living Color. James Eugene Carrey is a Canadian and American actor and comedian. Known for his energetic slapstick performances, Carrey first gained recognition in 1990, after landing a recurring role in the American sketch comedy television series In Living Color. James Eugene Carrey is a Canadian and American actor and comedian. Known for his energetic slapstick performances, Carrey first gained recognition in 1990, after landing a recurring role in the American sketch comedy television series In Living Color. James Eugene Carrey is a Canadian and American actor and comedian. Known for his energetic slapstick performances, Carrey first gained recognition in 1990, after landing a recurring role in the American sketch comedy television series In Living Color."),
//            Cast.init(name: "Ben\nSchwartz", status: "Acting", image: UIImage(named: "ben.jpeg"), birthday: "Sep 15, 1981", biography: "A veteran of the Upright Citizens Brigade comedy troupe, writer, stand-up and actor Ben Schwartz worked his way up from working as a studio page for \"The Late Show With David Letterman\" (CBS 1993-2015) to one of Hollywood's go-to funny guys thanks to a willingness to experiment, a razor-sharp wit and an impressively prolific work ethic."),
//            Cast.init(name: "Tika\nSumpter", status: "Acting", image: UIImage(named: "tika.jpeg"), birthday: "Jun 20, 1980", biography: "Actress Tika Sumpter was born Euphemia L. Sumpter on June 20, 1980 in Queens, NY. Sumpter was the first African-American cheerleader at her high school, Longwood Senior High, and she was the president of her class for three years. Sumpter's mother worked as a corrections officer at Rikers Island prison, and Tika learned strength and perseverance through her example."),
//            Cast.init(name: "Natasha\nRothwell", status: "Acting", image: UIImage(named: "natasha.jpeg"), birthday: "Oct 18, 1980", biography: "Writing served as the launching pad for two distinct phases of Natasha Rothwell's career in comedy: first, as her initial college major, which she left to study theater and  rin turn, establish a name for herself in improv comedy, and later, as a writer for \"Saturday Night Live\" (NBC, 1975), which provided her with the clout to co-produce the Netflix comedy series \"Characters\" (2016- ) and write for and star in the critically acclaimed HBO comedy series \"Insecure\" (2016- ).")
//    ]),
//        Movie.init(title: "The Batman", releaseDate: "2022-03-04", voteAverage: "★7.5", posterPatch: UIImage.init(named: "batman.jpeg"), details: "Batman ventures into Gotham City's underworld when a sadistic killer leaves behind a trail of cryptic clues. As the evidence begins to lead closer to home and the scale of the perpetrator's plans become clear, he must forge new relationships, unmask the culprit and bring justice to the abuse of power and corruption that has long plagued the metropolis.", poster: UIImage.init(named: "batman_cover.jpeg"), actors: [
//            Cast.init(name: "Robert\nPattinson", status: "Acting", image: UIImage(named: "robert.jpeg"), birthday: "", biography: ""),
//            Cast.init(name: "Zoë\nKravitz", status: "Acting", image: UIImage(named: "zoe.jpeg"), birthday: "", biography: ""),
//            Cast.init(name: "Jeffrey\nWright", status: "Acting", image: UIImage(named: "jeffrey.jpeg"), birthday: "", biography: ""),
//            Cast.init(name: "Colin\nFarrell", status: "Acting", image: UIImage(named: "colin.jpeg"), birthday: "", biography: ""),
//            Cast.init(name: "Paul\nDano", status: "Acting", image: UIImage(named: "paul.jpeg"), birthday: "", biography: ""),
//    ]),
//        Movie.init(title: "The Avengers", releaseDate: "2018-04-27", voteAverage: "★7.9", posterPatch: UIImage.init(named: "avengers.jpeg"), details: "Iron Man, Thor, the Hulk and the rest of the Avengers unite to battle their most powerful enemy yet -- the evil Thanos. On a mission to collect all six Infinity Stones, Thanos plans to use the artifacts to inflict his twisted will on reality. The fate of the planet and existence itself has never been more uncertain as everything the Avengers have fought for has led up to this moment.", poster: UIImage(named: "avengers_cover.jpeg"), actors: [
//            Cast.init(name: "Robert\nDowney Jr.", status: "Acting", image: UIImage(named: "robertd.jpeg"), birthday: "", biography: ""),
//            Cast.init(name: "Chris\nHemsworth ", status: "Acting", image: UIImage(named: "chris.jpeg"), birthday: "", biography: ""),
//            Cast.init(name: "Josh\nBrolin ", status: "Acting", image: UIImage(named: "josh.jpeg"), birthday: "", biography: ""),
//            Cast.init(name: "Chadwick\nBoseman ", status: "Acting", image: UIImage(named: "chadwick.jpeg"), birthday: "", biography: ""),
//            Cast.init(name: "Mark\nRuffalo ", status: "Acting", image: UIImage(named: "mark.jpeg"), birthday: "", biography: "")
//        ])
//    ]
//}
