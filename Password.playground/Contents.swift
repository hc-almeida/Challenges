import UIKit

do {
    
    func checkPassword(_ password: String) -> Bool {
        let firstLetter = password.first?.isUppercase ?? false
        let numbers = CharacterSet(["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"])
        let notContainCharacterSpecial = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")

        if !firstLetter {
            return false
        }
    
        if password.count < 5 || password.count > 15 {
            return false
        }
    
        if !(password.rangeOfCharacter(from: numbers) != nil) {
            return false
        }
    
        if !(password.rangeOfCharacter(from: CharacterSet.lowercaseLetters) != nil) {
            return false
        }
    
        if !(password.rangeOfCharacter(from: CharacterSet.uppercaseLetters) != nil) {
           return false
        }
    
        if (password.rangeOfCharacter(from: notContainCharacterSpecial.inverted) != nil) {
            return false
        }
        
        // Extrair os numeros da string e atribui em uma variavel
        let digits = password.components(separatedBy: CharacterSet.decimalDigits.inverted)
        var digitsStr: String = ""
        
        for item in digits {
            digitsStr = item
        }
        
        let digitsArray = digitsStr.compactMap{ $0.wholeNumberValue }
        let isNumbersValidated = validateNumbers(digitsArray)
        
        return true && isNumbersValidated
    }
    
    // Valida sequencia numerica
    func validateNumbers(_ numbers: [Int]) -> Bool {
        guard numbers.count < 1 || numbers.count > 2 else {
            return true
        }
        
        var previous: Int? = nil
        
        for numero in numbers {
            if let previous = previous {
                if numero == previous + 1 {
                    return false
                }
            }
            previous = numero
        }
        return true
    }
    
    // Senhas válidas
    checkPassword("Senha137")
    checkPassword("Senha11")
    checkPassword("Senha12")
    checkPassword("Senha1")
    checkPassword("S1en2ha3")
    checkPassword("Senha333")
    
    // Senhas inválidas
    checkPassword("Senha158@")
    checkPassword("s1en2ha3")
    checkPassword("Senha456")
    checkPassword("Senha@")
}
