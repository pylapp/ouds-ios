// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

// swiftlint:disable missing_docs

// MARK: - Operator -- (Int)

postfix operator --

extension Int {

    @discardableResult
    public static postfix func -- (value: inout Int) -> Int {
        value -= 1
        return value
    }
}

// MARK: - Operator ++ (Int)

postfix operator ++

extension Int {

    @discardableResult
    public static postfix func ++ (value: inout Int) -> Int {
        value += 1
        return value
    }
}

// swiftlint:enable missing_docs
