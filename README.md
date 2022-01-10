# Farmer-sheep-wolf-and-cabbage-problem
This program solves the famous farmer, sheep, wolf and cabbage problem. The farmer wants to cross the river from the east shore to the west shore, but his boat is small. The boat has space for only the farmer with one of the items: cabbage, wolf, or goat. The farmer cannot leave the wolf alone with the goat or the goat alone with the cabbage.

Each state can be represented by the tuple (FP, GP, WP, CP), where the variables FP, GP, WP, CP can have only two values (e, w), which indicate the position east or west of the farmer, goat, wolf, and cabbage. We are implementing a depth-first and a breadth-first search to solve the famer, goat, wolf and cabbage problem. The list that holds the all the valid moves is implemented similarly but are read differently in our loop with depth-first being a stack and breadth-first being a queue. The list path holds all the moves that were taken.

Output by Depth-first Search:

![image](https://user-images.githubusercontent.com/40967818/148720068-32c7e418-2d33-4531-b6d6-b7e2fa29027b.png)
Output by Breadth-first Search:
![image](https://user-images.githubusercontent.com/40967818/148720086-848197b8-52a1-4738-ba6c-38d2cef36aea.png)

