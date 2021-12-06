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
            printSquare(endSquare: currentSquared)
        }
    } else {
        while value <= 8 {
            currentSquared[index] = value + 1
            print(currentSquared)
            let placement = index + 1
            value += 1
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
    let barrier = "\n*****"
    let space = " "
    let nextLine = "\n"
    print(barrier)
    var length = 0
    while length < endSquare.count {
        if length == 3 || length == 6 {
            print(nextLine)
            print(endSquare[length], space)
        } else {
            print(endSquare[length], space)
        }
        length += 1
    }
    print(barrier)
}

genSquare(square: magicSquare, currentSquare: extraArray, index: begin)
