//Climbing Stairs

func climbStairs(_ n: Int) -> Int {
    if n <= 2 { return n}
    var dp = Array(repeating: 0, count: n + 1)
    dp[1] = 1
    dp[2] = 2
    for i in 3...n {
        dp[i] = dp[i - 1] + dp[i - 2]
    }
    return dp[n]
}

print(climbStairs(4))

//Coin Change
func coinChange(_ coins: [Int],_ amount: Int) -> Int {
    var dp = Array(repeating: 0, count: amount + 1)
    dp[0] = 1
    for coin in coins {
        for i in coin...amount {
            dp[i] += dp[i - coin]
        }
    }
    return dp[amount]
}
let result = coinChange([1,2,5], 5)
print(result)

//Longest Increasing Subsequence (LIS)

func longestSubsequence(_ nums: [Int]) -> Int{
    var dp  = Array(repeating: 1, count: nums.count)
    for i in 0...(nums.count - 1) {
        for j in 0...i {
            if nums[j] < nums[i] {
                dp[i] = max(dp[i], dp[j] + 1)
            }
        }
    }
    return dp.max() ?? 0
}
print(longestSubsequence([10, 9, 2, 5, 3, 7, 101, 18]))
