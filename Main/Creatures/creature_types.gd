extends Node

# All possible mutations are stored here sorted by base creature type. 
# When a creature is modified we check if it's new traits match any of the mutations.
# If they do - we pick a random matching mutation, despawn old creature, spawn a new mutant with inherited traits

var buff_rat = {  
	"name": 'creature_rat_buff',
	"base_creature": 'rat',
	"req": {
		'size':         range(0, 101), 
		"strength":     range(50, 101),
		'intelligence': range(0, 101), 
		'aggression':   range(0, 101), 
		'cuteness':     range(0, 101), 
		'speed':        range(0, 101)
		}
}

var splinter = {  
	"name": 'creature_rat_splinter',
	"base_creature": 'rat',
	"req": {
		'size':         range(0, 101), 
		"strength":     range(50, 101),
		'intelligence': range(70, 101), 
		'aggression':   range(0, 101), 
		'cuteness':     range(0, 101), 
		'speed':        range(60, 101)
			}
}

var aggressive_rat = {  
	"name": 'creature_rat_aggressive',
	"base_creature": 'rat',
	"req": {
		'size':         range(0, 101), 
		"strength":     range(0, 101),
		'intelligence': range(0, 101), 
		'aggression':   range(70, 101), 
		'cuteness':     range(0, 101), 
		'speed':        range(0, 101)
			}
}

var rat = [buff_rat, splinter, aggressive_rat]
var dog = []
var monkey = []
var rabbit = []
