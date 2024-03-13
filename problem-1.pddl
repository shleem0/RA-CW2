(define(problem task1_2)
    (:domain shoppEdWorld)
    (:objects
        robot - shopBot
        iceLolly pizza toothpaste shampoo bread ketchup cabbage potato - shopItem
        cell1 cell2 cell3 cell4 cell5 cell6 cell7 cell8 cell9 cell10 cell11 cell12 cell13 cell14 cell15 cell16 cell17 cell18 cell19 cell20 - aisle
        left1 left2 left3 left4 right1 right2 right3 right4 - shelf
        scale - scale
        checkOutStand - checkout
    )

    (:init
        (location robot cell20)
        (armsEmpty robot)

        (location iceLolly right1)
        (location pizza right2)
        (location toothpaste right3)
        (location shampoo right4)

        (location cabbage left1)
        (needsWeighing cabbage)

        (location potato left2)
        (needsWeighing potato)

        (location bread left3)
        (location ketchup left4)

        (adjacent cell1 cell2)
        (adjacent cell1 scale)
        (adjacent cell1 left1)

        (adjacent cell2 cell1)
        (adjacent cell2 cell3)
        (adjacent cell2 left2)

        (adjacent cell3 cell2)
        (adjacent cell3 cell5)

        (adjacent cell4 scale)
        (adjacent cell4 cell9)

        (adjacent cell5 cell3)
        (adjacent cell5 cell6)
        (adjacent cell5 cell12)

        (adjacent cell6 cell5)
        (adjacent cell6 cell7)
        (adjacent cell6 right1)
        (adjacent cell6 right3)

        (adjacent cell7 cell6)
        (adjacent cell7 cell8)
        (adjacent cell7 right2)
        (adjacent cell7 right4)

        (adjacent cell8 cell7)
        (adjacent cell8 cell13)

        (adjacent cell9 cell4)
        (adjacent cell9 cell10)
        (adjacent cell9 cell14)

        (adjacent cell10 cell9)
        (adjacent cell10 cell11)
        (adjacent cell10 left1)
        (adjacent cell10 left3)

        (adjacent cell11 cell10)
        (adjacent cell11 cell12)
        (adjacent cell11 left2)
        (adjacent cell11 left4)

        (adjacent cell12 cell5)
        (adjacent cell12 cell11)
        (adjacent cell12 cell15)

        (adjacent cell13 cell8)
        (adjacent cell13 cell18)

        (adjacent cell14 cell9)
        (adjacent cell14 scale)

        (adjacent cell15 cell12)

        (adjacent cell16 cell15)
        (adjacent cell16 cell17)
        (adjacent cell16 right3)

        (adjacent cell17 cell16)
        (adjacent cell17 cell18)
        (adjacent cell17 right4)

        (adjacent cell18 cell13)
        (adjacent cell18 cell17)
        (adjacent cell18 cell20)

        (adjacent cell19 cell20)
        (adjacent cell19 cell17)

        (adjacent cell20 cell18)
        (adjacent cell20 cell19)
    )

    (:goal (and
        (checkedOut potato)
        (checkedOut ketchup)
        (checkedOut toothpaste)
        (checkedOut pizza)    
        )
    )
)