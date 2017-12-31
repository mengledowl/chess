# Chess

Given a position on a chess board in the format of `a1`, and the name of a chess piece, returns a list of possible moves that piece can make. Assumes that no other pieces exist on the board. Currently supports moves for `knight`, `queen`, and `rook`.

## Usage

From the root directory of the project:

```
$ ruby lib/chess.rb -position a1 -piece queen
b2, c3, d4, e5, f6, g7, h8, b1, c1, d1, e1, f1, g1, h1, a2, a3, a4, a5, a6, a7, a8

$ ruby lib/chess.rb -position d4 -piece knight
e6, f3, c2, b5, f5, e2, b3, c6
```