/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Variable types: integer, float, boolean
 - Variable assignment
 - Printing variables
 - Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
 
 
 Equals: ==
 Not equals: !=
 Greater/Less: > / <
 or equal: >= / <=
*/



//VAR health = 5
VAR pet_name = ""
//VAR speed = 4.5
VAR torches = 0
VAR color = ""
VAR scarf = 0


-> memory

== memory ==
Before you stands the cavern of Ben. You wish your childhood pet was with you. What was your pet's name?
* [Charlie] 
    ~ pet_name = "Charlie"
    -> memory2
* [Susan] 
    ~ pet_name = "Susan"
    -> memory2
* [Olive] 
    ~ pet_name = "Olive"
    -> memory2

== memory2 ==
You see a light in the distance.
What was your favorite color?
* [Red]
    ~ color = "red"
    -> cave_mouth
* [Blue]
    ~ color = "blue"
    -> cave_mouth
* [Yellow]
    ~ color = "yellow"
    -> cave_mouth


== cave_mouth ==
You are at the enterance to a cave. {not torch_pickup:There is a torch on the floor.} The cave extends to the east and west.
{pet_name} looks up at you with beady eyes.
You have {torches} torches.

+ [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
* [Pick up the torch] -> torch_pickup

== east_tunnel ==
You are in the east tunnel. It is very dark, you can't see anything.
+ {torches > 0} [Light Torch] -> east_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

== west_tunnel ==
You are in the west
{pet_name == "Olive": Olive loves it here.| }
You see a small chest on the floor.
+ [Go Back] -> cave_mouth
* [Open the chest] -> chest
-> END

== chest ==
You open the chest. Inside, you see a {color} scarf. You put it on. It fits perfectly.
~ scarf = scarf + 1
* [Go Back] -> west_tunnel

=== torch_pickup ===
~ torches = torches + 1
You now have a torch. May it light the way.
* [Go Back] -> cave_mouth
-> END

== east_tunnel_lit ==
The light of your torch bounces off the walls. A mirror stands before you.
{scarf > 0: Your scarf looks dashing on you.| You feel like you're missing something.}
+ [Go Back]
-> cave_mouth
* {scarf > 0} [Go home.]
-> home

== home ==
You begin the trek home. Your scarf flows in the wind. The weather is very nice.
* [Continue]
-> end_home
+ [Pause] You wait.
-> home

== end_home ==
Your home stands before you. It is just how you remember.
-> END