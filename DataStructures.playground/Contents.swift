import UIKit

// 1. Создайте массив целых чисел и реализуйте функцию, которая изменяет порядок элементов в массиве на обратный. Напишите функцию для удаления всех вхождений определенного значения из массива.

let intArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

func reverseAndFilter(_ array: [Int], toDelete: Int) -> [Int] {
    var reversedArray = [Int]()
    for elem in array {
        reversedArray.insert(elem, at: 0)
    }
    return reversedArray.filter { $0 != toDelete }
}

let result1 = reverseAndFilter(intArray, toDelete: 3)
print(result1)

// 2. Дан массив строк, верните подмассив в котором будут строки больше указанной длины

let stringArray = ["Hello", "World", "HelloWorld", "Привет", "Мир"]

func subarray(_ array: [String], with length: Int) -> [String]? {
    return array.filter { $0.count > length }
}

let result2 = subarray(stringArray, with: 5)

// 3. Дан массив целых чисел, верните подмассив в котором будут только нечетные числа

func filterUneven(_ array: [Int]) -> [Int]? {
    return array.filter { $0 % 2 != 0 }
}

let result3 = filterUneven(intArray)

// 4. Напишите функцию, которая принимает массив чисел и возвращает массив чисел, возведенных в квадрат

func squared(_ array: [Int]) -> [Int] {
    return array.map { $0 * $0 }
}

let result4 = squared(intArray)


// 5. Напишите функцию, которая объединяет два отсортированных массива в один отсортированный массив без использования метода sort

let array1 = [10, 20, 30, 40, 50]
let array2 = [1, 10, 15, 25, 30, 35, 45]

func joinSortedArrays(_ array1: [Int], and array2: [Int]) -> [Int] {
    var result: [Int] = []
    var i = 0
    var j = 0
    
    while i < array1.count && j < array2.count {
        if array1[i] < array2[j] {
            result.append(array1[i])
            i += 1
        } else {
            result.append(array2[j])
            j += 1
        }
    }
    
    while i < array1.count {
        result.append(array1[i])
        i += 1
    }
    
    while j < array2.count {
        result.append(array2[j])
        j += 1
    }
    
    return result
}

let result5 = joinSortedArrays(array1, and: array2)

// 6. Напишите функцию, которая принимает на вход два массива и возвращает массив, содержащий только уникальные элементы, присутствующие в обоих входных массивах.

func uniqueElementsFrom(_ array1: [Int], and array2: [Int]) -> [Int]? {
    let set2 = Set(array2)
    var result: [Int] = []
    var seen: Set<Int> = []
    
    for element in array1 {
        if set2.contains(element) && !seen.contains(element) {
            result.append(element)
            seen.insert(element)
        }
    }
    return result
}

let result6 = uniqueElementsFrom(array1, and: array2)


// 7. Дан массив чисел, реализуйте функцию, которая находит в нем подмассив заданного размера с наибольшей суммой элементов.

func biggestSubarray(_ array: [Int], of size: Int) -> [Int]? {
    guard size > 0, size <= array.count else { return nil }
    
    var maxSum = 0
    var currentSum = 0
    var startIndex = 0
    
    for i in 0..<size {
        currentSum += array[i]
    }
    maxSum = currentSum
    
    for i in size..<array.count {
        currentSum += array[i] - array[i - size]
        if currentSum > maxSum {
            maxSum = currentSum
            startIndex = i - size + 1
        }
    }
    return Array(array[startIndex..<startIndex + size])
}

let unsortedArray = [1, 2, 5, 2, 8, 1, 5]
let result7 = biggestSubarray(unsortedArray, of: 3)

// 8. Напишите функцию, проверяющую, является ли один set подмножеством второго set.

func isContainingSubset(_ set1: Set<String>, _ set2: Set<String>) -> Bool {
    return set2.isSubset(of: set1)
}

print(isContainingSubset(["cocoa beans", "sugar", "cocoa butter", "salt"], ["cocoa beans", "sugar"]))

// 9. Напишите функцию, которая вычисляет симметричную разницу между двумя множествами, то есть элементы, которые присутствуют в одном из множеств, но не в обоих.

func symmetricDifference(_ set1: Set<String>, _ set2: Set<String>) -> Set<String> {
    return set1.symmetricDifference(set2)
}

// 10. Дан словарь студентов и их тестовых баллов, и словарь соответствия минимального уровня баллов и оценки. Выдать словарь, в котором будут пары студент-оценка.

func calculateGrades(studentsScores: [String: Int], minGrades: [Int: Int]) -> [String: Int] {
    var result = [String: Int]()
    let sorted = minGrades.sorted { $0.key > $1.key }
    
    for (student, score) in studentsScores {
        for (key, grade) in sorted {
            if score >= grade {
                result[student] = key
                break
            } else {
                result[student] = 1
            }
        }
    }
    return result
}

print(calculateGrades(studentsScores: ["A": 92, "B": 73, "C": 52, "D": 12, "E": 32],
                      minGrades: [5: 90, 4: 70, 3: 50, 2: 30]))

// 11. Дан массив словарей вида: ключ-строка, значение-число. Вернуть один объединенный словарь, в котором для одинаковых ключей значения будут суммированы.

func sumEqualKeys(_ dictArray: [[String: Int]]) -> [String: Int] {
    var result = [String: Int]()
    
    for dict in dictArray {
        for (key, value) in dict {
            result[key, default: 0] += value
        }
    }
    return result
}

// 12. Напишите функцию для сохранения структуры словаря в формат JSON. Реализуйте соответствующую функцию десериализации для восстановления словаря по JSON


func dictionaryToJSON<T: Encodable>(_ dictionary: T) throws -> String {
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    let jsonData = try encoder.encode(dictionary)
    if let jsonString = String(data: jsonData, encoding: .utf8) {
        return jsonString
    } else {
        print("Error while trying serialize dictioanary")
    }
    return ""
}

func jsonToDictionary<T: Decodable>(_ jsonString: String, as type: T.Type) throws -> T {
    guard let jsonData = jsonString.data(using: .utf8) else {
        throw NSError(domain: "Invalid JSON String", code: 1, userInfo: nil)
    }
    let decoder = JSONDecoder()
    let dictionary = try decoder.decode(T.self, from: jsonData)
    return dictionary
}

// 13. Создайте функцию, которая удаляет повторяющиеся значения из словаря, сохраняя только последнее вхождение каждого значения

func removeDuplicates<K: Hashable, V: Hashable>(from dict: [K: V]) -> [K: V] {
    var uniqueValues = Set<V>()
    var result: [K: V] = [:]
    
    for (key, value) in dict {
        if !uniqueValues.contains(value) {
            uniqueValues.insert(value)
            result[key] = value
        }
    }
    return result
}
