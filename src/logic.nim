#[
  Project GameJam
    Name Of Project: Tag You're Switched
    Author:          #DavyG
    License:         MIT
    Description:     Logic File.
]#

proc inRange* (number: int8, rStart: int8, rStop: int8): bool = 
  # Beware that this is an inclusive range rStart..rStop
  return (number >= rStart) and (number <= rStop)

proc modulo* (a: int8, b: int8): int8 =
  let remain: int8 = a mod b
  result = if remain < 0: b + remain else: remain