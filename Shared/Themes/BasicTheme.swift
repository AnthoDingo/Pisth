// This source file is part of the https://github.com/ColdGrub1384/Pisth open source project
//
// Copyright (c) 2017 - 2018 Adrian Labbé
// Licensed under Apache License v2.0
//
// See https://raw.githubusercontent.com/ColdGrub1384/Pisth/master/LICENSE for license information

#if os(iOS)
    import UIKit
#endif

/// Basic theme for the terminal.
class BasicTheme: TerminalTheme {
    
    #if os(iOS)
        /// Returns light.
        override var keyboardAppearance: UIKeyboardAppearance {
            return .light
        }
    
        /// Returns default.
        override var toolbarStyle: UIBarStyle {
            return .default
        }
    #endif
    
    /// Returns light blue.
    override var selectionColor: Color? {
        return Color(red: 164/255, green: 205/255, blue: 255/255, alpha: 0.5)
    }
    
    /// Returns white.
    override var backgroundColor: Color? {
        return .white
    }
    
    /// Returns black.
    override var foregroundColor: Color? {
        return .black
    }
    
    /// Returns gray.
    override var cursorColor: Color? {
        return Color(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
    }
}
