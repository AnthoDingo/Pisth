// This source file is part of the https://github.com/ColdGrub1384/Pisth open source project
//
// Copyright (c) 2017 - 2018 Adrian Labbé
// Licensed under Apache License v2.0
//
// See https://raw.githubusercontent.com/ColdGrub1384/Pisth/master/LICENSE for license information

/// Homebrew theme for the terminal.
open class HomebrewTheme: TerminalTheme {
    
    open override var selectionColor: Color? {
        return Color(red: 9/255, green: 0/255, blue: 233/255, alpha: 0.5)
    }
    
    open override var backgroundColor: Color? {
        return .black
    }
    
    open override var foregroundColor: Color? {
        return Color(red: 40/255, green: 254/255, blue: 20/255, alpha: 1)
    }
    
    open override var cursorColor: Color? {
        return Color(red: 56/255, green: 254/255, blue: 39/255, alpha: 1)
    }
}

