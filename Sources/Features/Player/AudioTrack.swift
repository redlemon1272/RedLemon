import Foundation

struct AudioTrack: Equatable, Identifiable {
    let id: Int
    let lang: String?
    let title: String?

    var displayName: String {
        // Translate common language names to English
        let translatedTitle = AudioTrack.translateToEnglish(title)
        let translatedLang = AudioTrack.languageCodeToEnglish(lang)

        if let title = translatedTitle, !title.isEmpty {
            return title
        } else if let lang = translatedLang, !lang.isEmpty {
            return lang
        } else {
            return "Track \(id)"
        }
    }
    
    // Helper function to translate common language names
    private static func translateToEnglish(_ text: String?) -> String? {
        guard let text = text else { return nil }
        let lower = text.lowercased()

        let translations: [String: String] = [
            "español": "Spanish",
            "espanol": "Spanish",
            "inglés": "English",
            "ingles": "English",
            "angielski": "English",  // Polish for "English"
            "français": "French",
            "francais": "French",
            "deutsch": "German",
            "italiano": "Italian",
            "português": "Portuguese",
            "portugues": "Portuguese",
            "日本語": "Japanese",
            "中文": "Chinese",
            "한국어": "Korean",
            "русский": "Russian"
        ]

        for (foreign, english) in translations {
            if lower.contains(foreign) {
                return text.replacingOccurrences(of: foreign, with: english, options: .caseInsensitive)
            }
        }

        return text
    }

    // Helper function to convert language codes to full English names
    private static func languageCodeToEnglish(_ code: String?) -> String? {
        guard let code = code else { return nil }
        let lower = code.lowercased()

        let languageNames: [String: String] = [
            "en": "English",
            "eng": "English",
            "es": "Spanish",
            "spa": "Spanish",
            "fr": "French",
            "fre": "French",
            "fra": "French",
            "de": "German",
            "ger": "German",
            "deu": "German",
            "it": "Italian",
            "ita": "Italian",
            "pt": "Portuguese",
            "por": "Portuguese",
            "ja": "Japanese",
            "jpn": "Japanese",
            "zh": "Chinese",
            "chi": "Chinese",
            "zho": "Chinese",
            "ko": "Korean",
            "kor": "Korean",
            "ru": "Russian",
            "rus": "Russian",
            "ar": "Arabic",
            "ara": "Arabic",
            "hi": "Hindi",
            "hin": "Hindi"
        ]
        
        return languageNames[lower] ?? code.uppercased()
    }
}
