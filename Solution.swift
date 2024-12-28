class Solution {
    func maximumSubarraySum(_ nums: [Int], _ k: Int) -> Int {
        
        var l = 0
        var dict = [Int: Int]()
        var sum = 0
        var result = 0

        for r in 0..<nums.count {

            let numl = nums[l]
            let numr = nums[r]

            sum += numr
            dict[numr, default: 0] += 1

            if r - l + 1 == k {

                if dict.count == k {
                    result = max(result, sum)
                }
                
                if dict[numl] == 1 {
                    dict[numl] = nil
                } else {
                    dict[numl, default: 0] -= 1
                }

                sum -= numl
                l += 1
            }
        }

        return result
    }
}
