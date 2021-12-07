let three = 3
let four = 4
let five = 5
let six = 6
let seven = 7
let eight = 8
let nine = 9
let magicNum = 15
var value = 0
let magicSquare: [Int] = [1, 2, three, four, five, six, seven, eight, nine]
let extraArray: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
let begin = 0

func genSquare(square: [Int], currentSquare: [Int], index: Int) {
    var currentSquared = currentSquare
    if index == 9 {
        let check = allDifferent(preSquare: currentSquared, place: 0)
        if check == true {
            let checkers = isMagic(squared: currentSquared)
            if checkers == true {
                printSquare(endSquare: currentSquared)
            }
        }
    } else {
        for number in 0...8 {
            currentSquared[index] = number + 1
            let placement = index + 1
            genSquare(square: square, currentSquare: currentSquared,
                      index: placement)
        }
    }
}

func allDifferent(preSquare: [Int], place: Int) -> Bool {
    var answer = true
    if (place == 8) {
        answer = true
    } else {
        var result = 0
        var checker = 0
        while checker <= 8 {
            if checker == place {
                result += 0
            } else if preSquare[place] == preSquare[checker] {
                result += 1
            }
            checker += 1
        }
        if result == 0 {
            let spot = place + 1
            answer = allDifferent(preSquare: preSquare, place: spot)
        } else {
            answer = false
        }

    }
    return answer
}

func printSquare(endSquare: [Int]) {
    let barrier = "\n*********"
    let space = " "
    let nextLine = "\n"
    print(barrier)
    var length = 0
    while length <= 6 {
        print(endSquare[length], space, endSquare[length + 1], space,
            endSquare[length + 2])
        if length != 6 {
            print(nextLine)
        }
        length += 3
    }
    print(barrier)
}

func isMagic(squared: [Int]) -> Bool {
    let row1 = squared[0] + squared[1] + squared[2]
    let row2 = squared[3] + squared[4] + squared[5]
    let row3 = squared[6] + squared[7] + squared[8]
    let col1 = squared[0] + squared[3] + squared[6]
    let col2 = squared[1] + squared[4] + squared[7]
    let col3 = squared[2] + squared[5] + squared[8]
    let diag1 = squared[0] + squared[4] + squared[8]
    let diag2 = squared[2] + squared[4] + squared[6]
    return (row1 == magicNum && row2 == magicNum && row3 == magicNum
           && col1 == magicNum && col2 == magicNum && col3 == magicNum
           && diag1 == magicNum && diag2 == magicNum)
}


genSquare(square: magicSquare, currentSquare: extraArray, index: begin)
