extends Control

@onready var review_label: Label = %ReviewTextLabel
@onready var reviewer_label: Label = %ReviewerTextLabel

func paste_reviews_info(review: Review) -> void:
	review_label.text = review.review
	reviewer_label.text = review.reviewer
