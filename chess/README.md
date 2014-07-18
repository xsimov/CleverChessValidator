# Chess Validator

A company that specializes in building mediocre games for social networking platforms has offered you a fistful of cash in the form of a one percent profit sharing agreement and free pizza. All you need to do is prove that you're the kind of rockstar programmer they need on staff by taking a simple test. Because you know that you're exactly the sort of ninja frogman devops superstar that they're looking for, you decide to give it a shot.

Your task is to create a Chess move validator: given a list of moves and a board, you are expected to determine whether each move is LEGAL or ILLEGAL. Some sample input and output files are provided to make this task a little bit easier for you to work on.

## The Board

The board is represented in the simple ASCII format shown below:

```
bR bN bB bQ bK bB bN bR
bP bP bP bP bP bP bP bP
-- -- -- -- -- -- -- --
-- -- -- -- -- -- -- --
-- -- -- -- -- -- -- --
-- -- -- -- -- -- -- --
wP wP wP wP wP wP wP wP
wR wN wB wQ wK wB wN wR
```

Each piece is represented by two characters. The first character represents the player's color, and the second character represents the rank of the piece. Empty squares are represented by `--`.

## Evaluating Moves

Moves are listed using coordinates similar to [algebraic chess notation](http://en.wikipedia.org/wiki/Algebraic_notation_%28chess%29), but start and ending positions are provided explicitly for each move to avoid the need to resolve ambiguities. One move is listed per line in the moves file, as shown below:

```
a2 a3
a2 a4
a2 a5
a7 a6
a7 a5
a7 a4
a7 b6
b8 a6
b8 c6
b8 d7
e2 e3
e3 e2
```

Each move should be evaluated independently against the provided board layout. The purpose of your validator will be to determine whether a given move is legal based on the initial board state: it is not meant to evaluate a sequence of moves.

While the _simple_moves.txt_ file only checks some basic pawn and knight moves, the _complex_moves.txt_ exercises most of the kinds of moves you would find in an ordinary chess game, as well as various forms of invalid moves. While you are expected to test for whether a move would be illegal due to creating a check condition, you can assume that no moves involve castling or en-passant conditions.

## Expected Output

For each move in your input file, there should be a corresponding line in your output file which indicates whether the move was LEGAL or ILLEGAL. For example, given the previously shown board (_simple_board.txt_) and move list (_simple_moves.txt_), your validator should output the following results:

```
LEGAL
LEGAL
ILLEGAL
LEGAL
LEGAL
ILLEGAL
ILLEGAL
LEGAL
LEGAL
ILLEGAL
LEGAL
ILLEGAL
```
