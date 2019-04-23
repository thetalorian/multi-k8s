def nestedArrayIndexer(nestedArray, index):
  if (len(nestedArray) != len(index)):
    print("Invalid Input")
    return None
  if (len(index) == 1):
    if (index[0] > len(nestedArray)):
      print("Invalid Index")
      return None
    else:
      return nestedArray[index[0]]
  else:
    return nestedArrayIndexer(nestedArray[index[0]],index[1:])

    