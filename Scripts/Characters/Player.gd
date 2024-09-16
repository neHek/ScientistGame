extends CharacterBody3D

class_name Player

const RUNNING_SPEED = 9.0
const SPEED = 5.0
const JUMP_VELOCITY = 4.5

var may_move: bool = true
var is_running: bool = false

@export
var level_canvas: CanvasLayer

signal Jump
signal Land
