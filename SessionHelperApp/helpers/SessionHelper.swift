

import SwiftUI

struct Session : Hashable{
    var weekDay: String
    var session: [SessionTask]
 
}

struct SessionTask : Hashable{
    var workout: String
    var setAmount: Int
    var setDuration: Int
   
}
