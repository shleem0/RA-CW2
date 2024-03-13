(define(domain shoppEdWorld)
    (:requirements :adl)

        (:types location moveable - object
                aisle shelf scale checkout - location
                shopBot shopItem - moveable
                weighingItem - shopItem)

    (:predicates
        (location ?domainItem - moveable ?location - location)
        (adjacent ?loc1 - location ?loc2 - location)

        (holding ?bot - shopBot ?item - shopItem)
        (armsEmpty ?bot - shopBot)

        (needsWeighing ?item - weighingItem)
        (checkedOut ?item - shopItem)
    )

    (:action move
        :parameters (
            ?bot - shopBot
            ?currentCell - aisle
            ?nextCell - aisle
        )
        :precondition (and 
            (location ?bot ?currentCell)
            (adjacent ?currentCell ?nextCell)
        )
        
        :effect (and 
            (location ?bot ?nextCell)  
        )
    )

    (:action pickUp
        :parameters(
            ?bot - shopBot
            ?botLocation - aisle
            ?item - shopItem
            ?itemLocation - location
        )
        :precondition (and 
            (location ?bot ?botLocation)
            (location ?item ?itemLocation)
            (adjacent ?botLocation ?itemlocation)
            (armsEmpty ?bot)
        )
        :effect (and 
            (not(armsEmpty ?bot))
            (holding ?bot ?item)
            (not(location ?item ?itemLocation))
        )
    )

    (:action drop
        :parameters (
            ?bot - shopBot
            ?botLocation - aisle
            ?item - shopItem
            ?location - location
        )
        :precondition (and 
            (holding ?bot ?item)
            (location ?bot ?botLocation)
            (adjacent ?botLocation ?location)
        )
        :effect (and 
            (armsEmpty ?bot)
            (location ?item ?location)
            (not(holding ?bot ?item))
        )
    )

    (:action weigh
        :parameters (
            ?bot - shopBot
            ?botLocation - aisle
            ?item - weighingItem
            ?scale - scale
        )
        :precondition (and 
            (holding ?bot ?item)
            (location ?bot ?botLocation)
            (needsWeighing ?item)
        )
        :effect (and
            (not(needsWeighing ?item))
        )
    )
    

    (:action checkOut
        :parameters (
            ?bot - shopBot
            ?botLocation
            ?item - shopItem
            ?checkOutDesk - checkout
        )
        :precondition (and 
            (armsEmpty ?bot)
            (location ?bot ?botLocation)
            (location ?item ?checkOutDesk)
            (adjacent ?botLocation ?checkOutDesk)
            (not(needsWeighing ?item))
        )
        :effect (and 
            (checkedOut ?item)
        )
    )
)
