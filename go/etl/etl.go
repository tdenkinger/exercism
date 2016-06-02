// Package etl provides a transforming function that converts a
// score-centric Scrabble tile data structure into a letter-centric structure.
package etl

import "strings"

// Transform accepts a map in the format {1: {"A", "E", "I"}}
// and returns a map in the format {"a": 1, "e": 1, "i": 1}
func Transform(scoreLetters map[int][]string) (letterScore map[string]int) {
	letterScore = make(map[string]int)
	for score, letters := range scoreLetters {
		for _, letter := range letters {
			letterScore[strings.ToLower(letter)] = score
		}
	}

	return
}