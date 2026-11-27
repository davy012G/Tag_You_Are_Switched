#[
  Project GameJam
    Name Of Project: Tag You're Switched
    Author:          #DavyG
    License:         MIT
    Description:     Main Game Loop...
]#

import raylib

const
  orientArr: array[4, array[2, int8]] = [
    [-1, 0],  # Up
    [0, 1],   # Right
    [1, 0],   # Down
    [0, -1]   # Left
  ]

type
  Field = ref object
    mazeMap: array[12, array[12, int8]]
    lenOfWidth: int8
    lenOfHeight: int8

type
  Player = ref object
    health: int8 # At least int 8 can reach 100 and that's enough for now... 
    position: array[2, int8]
    orient: int8

####################################################################################

proc inRange (number: int8, rStart: int8, rStop: int8): bool = 
  # Beware that this is an inclusive range rStart..rStop
  return (number >= rStart) and (number <= rStop)

proc modulo (a: int8, b: int8): int8 =
  let remain: int8 = a mod b
  result = if remain < 0: b + remain else: remain

####################################################################################

proc playerNextPos (player: Player): array[2, int8] =
  return [player.position[0] + orientArr[player.orient][0],
          player.position[1] + orientArr[player.orient][1]]

proc mapFill (field: Field, position: array[2, int8], fillInt: int8) =
  # field.mapFill(position, fillInt)
  field.mazeMap[position[0]][position[1]] = fillInt

proc checkIfYouCanGoForward (field: Field, player: Player): bool = 
  let nextPosition: array[2, int8] = player.playerNextPos()
  return field.mazeMap[nextPosition[0]][nextPosition[1]] == 0

proc changePosBasedOnOrient (player: Player, field: Field) =
  field.mapFill(player.position, 0)
  player.position[0] += orientArr[player.orient][0]
  player.position[1] += orientArr[player.orient][1]
  field.mapFill(player.position, 2)

proc checkIfStillInField (player: Player, field: Field): bool = 
  let nextPosition: array[2, int8] = player.playerNextPos()
  return inRange(nextPosition[0], 0, field.lenOfWidth - 1) and inRange(nextPosition[1], 0, field.lenOfHeight - 1)

proc movePlayer (player: Player, field: Field) = 
  if (player.checkIfStillInField(field) and field.checkIfYouCanGoForward(player)):
    changePosBasedOnOrient(player, field)

proc turnPlayer (player: Player, direction: int8) = 
  player.orient = modulo(player.orient + direction, 4)

proc mazeDraw(field: Field, width: int32, height: int32) =
  #[
    Since we already know what we want we don't need much parameters
  ]#

  let
    widthLen = field.lenOfWidth
    heightLen = field.lenOfHeight
    elemWidth = int16(width / widthLen)
    elemHeight = int16(height / heightLen)
    colorPallete = [White, Black, Red]

  var 
    x, y: int32

  for row in 0..<widthLen:
    x = 0
    for col in 0..<heightLen:
      drawRectangle(x, y, elemWidth, elemHeight, colorPallete[field.mazeMap[row][col]])
      x += elemWidth
    y += elemHeight

# Main Game Loop

proc mainGame() =
  echo("\nRunning...\n")

  const
    SCREENWIDTH: int16 = 800
    SCREENHEIGHT: int16 = 600

  var
    mainField: Field = Field(
      mazeMap: [
      #0  1  2  3  4  5  6  7  8  9  A  B
      [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],  #0
      [1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],  #1
      [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],  #2
      [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],  #3
      [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],  #4
      [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],  #5
      [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],  #6
      [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],  #7
      [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],  #8
      [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],  #9
      [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],  #10
      [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]   #11
    ],
    lenOfWidth: 12, lenOfHeight: 12)

    mainPlayer: Player = Player(health: 0, position: [1, 1], orient: 1)

  initWindow(SCREENWIDTH, SCREENHEIGHT, "Tag, You're Switched")
  setTargetFPS(60)

  while not windowShouldClose():
    if isKeyPressed(Up):
      mainPlayer.movePlayer(mainField)

    elif isKeyPressed(Left):
      mainPlayer.turnPlayer(-1)

    elif isKeyPressed(Right):
      mainPlayer.turnPlayer(1)

    elif isKeyPressed(Space):
      break

    beginDrawing()
    clearBackground(White)
    mainField.mazeDraw(SCREENWIDTH, SCREENHEIGHT)
    endDrawing()

  closeWindow()

proc test () = discard

when isMainModule:
  mainGame()
