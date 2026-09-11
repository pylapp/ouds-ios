// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOTokensRaw

/// Basically a size semantic token, used for width and height values, is a _ raw token,
/// it has the same final type, to keep grammar clean and clear with design system grammar.
public typealias SizeSemanticToken = DimensionRawToken
