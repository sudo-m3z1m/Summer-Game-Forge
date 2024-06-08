extends Control

@export var reviews_array: Array[Review]

@onready var review_label: Label = %ReviewTextLabel
@onready var reviewer_label: Label = %ReviewerTextLabel
@onready var reviews_timer: Timer = $ReviewsTimer
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	reviews_timer.timeout.connect(change_review)
	change_review()

func paste_reviews_info(review: Review) -> void:
	review_label.text = review.review
	reviewer_label.text = review.reviewer
	animation_player.play("TextAnimation")

func change_review() -> void:
	paste_reviews_info(reviews_array[randi() % reviews_array.size()])
