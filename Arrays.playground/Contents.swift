import Foundation
// aaabbccca --> 3a2b3c1a
func  countOfCharcharter(_ str: String) -> String {
    var result  = ""
    var countChar = 1
    if str.isEmpty {
        return ""
    }
    for i in str.indices.dropLast()   {
        let currentChar = str[i]
        let nextIndex = str.index(after: i)
        let nextChar = str[nextIndex]
        if currentChar == nextChar {
            countChar += 1
        } else {
            result += "\(countChar)\(currentChar)"
            countChar = 1
        }
    }
    if let last  = str.last {
        result += "\(countChar)\(last)"
    }
    
    return result
}
let resultt  = countOfCharcharter("aabbacccc")
print(resultt)


//Shuffle an Array with Equal Probability

func shuffleArray(_ arr: [Int]) -> [Int] {
    var array = arr
    for i in (0..<arr.count).reversed() {
        let j = Int.random(in: 0...i)
        (array[j], array[i]) = (array[i], array[j])
    }
    return array
}

print(shuffleArray([1, 2, 3, 4, 5]))

// Two Sum

func twoSum(_ arr:[Int], target:Int) -> [Int]? {
    var dic : [Int: Int] = [:]
    
    for i in 0..<arr.count {
        let complement = target - arr[i]
        if let index = dic[complement]{
            return [index, i]
        }
        dic[arr[i]] = i
        
    }
    return nil
}
if let result  = twoSum([2,7,11,15], target: 9) {
    print(result)
}

//2. Maximum Subarray
func maxSubArray(_ arr: [Int]) -> Int {
    var maxSum = Int.min
    var sum = 0
    
    
    for num in arr {
        sum += num
        maxSum = max(maxSum, sum)
        if sum < 0 {
            sum  = 0
        }
    }
    return maxSum
    
}
print(maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))
//3. Contains Duplicate

func containsDup(_ arr: [Int]) -> Bool {
    var set : Set<Int> = []
    
    for num in arr {
        if set.contains(num){
            return true
        }
        set.insert(num)
    }
    return false
}
print(containsDup([1,2,3,1]))

//4. Valid Anagram
func validAnagram(_ s: String,_ t: String) -> Bool {
    return s.sorted() == t.sorted() ? true : false
}
print(validAnagram("anagram","nagaram"))
//5. Valid Palindrome
func  validPalindrome(_ str: String) -> Bool {
    return str == String(str.reversed())
}

print(validPalindrome("radar"))
//define your color(e.g. red, green) in enum

enum Color {
    case red
    case green
    var description : String{
        switch self {
        case .red : "color is red"
        case .green : "this color is green"
            
        }
    }
}

func asyncFunc () async -> String {
    return await withCheckedContinuation { continuation in
        DispatchQueue.global().asyncAfter(deadline: .now() + 2){
            continuation.resume(returning:  "data fetched")
        }
    }
}
Task{
    let data  = await asyncFunc()
    print(data)
}


func convert(_ input: String, multiplier: Float, currency: String) -> String {
    let pattern = "\(currency)\\s*(\\d+)"
    var result = input

    let regex = try? NSRegularExpression(pattern: pattern, options: [])
    let matches = regex?.matches(in: input, options: [], range: NSRange(input.startIndex..., in: input)) ?? []
    for match in matches.reversed() {
        if let range = Range(match.range(at: 1), in: input), let value = Float(input[range]) {
            
            let newValue = value * multiplier
            result.replaceSubrange(range, with: String(format: "%.0f", newValue))
        }
    }

    return result
}
let input = "John has USD 300. Mary borrowed USD75 from him."
let output = convert(input, multiplier: 0.8, currency: "USD")


