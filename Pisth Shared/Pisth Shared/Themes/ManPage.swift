// This source file is part of the https://github.com/ColdGrub1384/Pisth open source project
//
// Copyright (c) 2017 - 2018 Adrian Labbé
// Licensed under Apache License v2.0
//
// See https://raw.githubusercontent.com/ColdGrub1384/Pisth/master/LICENSE for license information

#if os(iOS)
    import UIKit
#endif

/// Man page theme for the terminal.
open class ManPageTheme: TerminalTheme {
    
    #if os(iOS)
        /// Returns light.
        open override var keyboardAppearance: UIKeyboardAppearance {
            return .light
        }
    
        /// Returns default.
        open override var toolbarStyle: UIBarStyle {
            return .default
        }
    #endif
    
    /// Returns light blue.
    open override var selectionColor: Color? {
        return Color(red: 164/255, green: 205/255, blue: 255/255, alpha: 0.5)
    }
    
    /// Returns a sort of yellow.
    open override var backgroundColor: Color? {
        return Color(red: 254/255, green: 244/255, blue: 156/255, alpha: 1)
    }
    
    /// Returns a black.
    open override var foregroundColor: Color? {
        return .black
    }
    
    /// Returns a gray.
    open override var cursorColor: Color? {
        return Color(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
    }
}

