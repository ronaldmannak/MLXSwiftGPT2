//
//  Tokenizer.swift
//  MLXSwiftGPT2
//
//  Created by Ronald Mannak on 9/2/24.
//

import Foundation
import MLX
import MLXNN

class Tokenizer {
    
    /// Mapping from vocab to integers and v.v.
    private var itos = [Int: Character]()
    private var stoi = [Character: Int]()
    
    convenience init(url: URL = URL(string: "https://raw.githubusercontent.com/karpathy/char-rnn/master/data/tinyshakespeare/input.txt")!) throws {
        print("fetching \(url.absoluteString)")
        let text = try String(contentsOf: url)
        self.init(text: text)
    }
    
    init(text: String) {
        // ["\n", " ", "!", "$", "&", "\'", ",", "-", ".", "3", ":", ";", "?", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
        let vocab = Set(text).sorted()
        for (i, c) in vocab.enumerated() {
            itos[i] = c
            stoi[c] = i
        }
    }
    
    // Encode function
    func encode(_ string: String) -> [Int] {
        return string.compactMap { stoi[$0] }
    }

    // Decode function
    func decode(_ tokens: [Int]) -> String {
        return tokens.compactMap { itos[$0] }.map { String($0) }.joined()
    }
}
