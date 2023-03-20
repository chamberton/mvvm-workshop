//
//  AnimeDataSourceImplementation.swift
//  MVVM-C-Example
//
//  Created by Serge Mbamba on 2023/03/20.
//

import Foundation

final class AnimeDataSourceImplementation : AnimeDataSource {
    
    private let data = [
        AnimeModel(name : "My Hero Academia", image : "my_hero_academia", description : """
In a world where those with powers are known as "Quirks," Izuku Midoriya has aspirations to one day become a hero but there's a catch -- he isn't a Quirk. After a tragic accident involving his friend Katuski Bakugo; Midoriya is the only one to have stepped forward to help protect Bakugo from a villain, because of his acts, he is given a gift by the world's greatest hero, All Might. Now, Midoriya attends U.A. School--a school that cultivates the next generation of superheroes.
"""),
        AnimeModel(name : "Dragon ball Z", image : "dragon_ball_z", description : """
Dragon Ball Z" follows the adventures of Goku who, along with the Z Warriors, defends the Earth against evil. The action adventures are entertaining and reinforce the concept of good versus evil. "Dragon Ball Z" teaches valuable character virtues such as teamwork, loyalty, and trustworthiness
"""),
        AnimeModel(name : "Knights of the Zodiac", image : "knights_of_the_zodiac", description : "A group of young warriors in magical armour protect the reincarnation of goddess Athena from evil forces who wish to destroy the world."),
        AnimeModel(name : "Tom and Jerry", image : "tom_and_jerry", description : "Tom and Jerry is an American animated media franchise and series of comedy short films created in 1940 by William Hanna and Joseph Barbera. Best known for its 161 theatrical short films by Metro-Goldwyn-Mayer, the series centers on the rivalry between the titular characters of a cat named Tom and a mouse named Jerry."),
        AnimeModel(name : "Toy Store", image : "toy_story", description : """
In a world where toys come to life in the absence of humans, a group of toys is preparing to move into a new house with their owner, Andy Davis, his sister, Molly, and their single mother. The toys become uneasy when Andy has his birthday party a week early; pullstring cowboy doll Sheriff Woody, Andy's favorite toy and their leader, sends Sarge and his green army men to spy on the gift-opening with a baby monitor in hopes of calming the others. The other toys which include Mr. Potato Head, Slinky Dog, Rex (a toy dinosaur), Hamm (a piggy bank), and Bo Peep (a porcelain doll) are relieved when Andy receives nothing that could replace them. Andy then receives a last-minute surprise gift from his mother: A Buzz Lightyear action figure, who believes he is an actual space ranger. Buzz impresses the other toys with his various features, and becomes Andy's new favorite toy, making Woody jealous.
""")
    ]
    
    func getAllAnimes() -> [AnimeModel]? {
        return []
    }
    
    func getAnime(by id: Int) -> AnimeModel? {
        return (id <= (data.count - 1) && id >= 0 ) ? data[id] : nil
    }
    
    
}
