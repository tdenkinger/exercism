// Package hamming calculates the 'hamming distance' between nucleotide strands.
package hamming

// Distance takes two nucleotide strands, compares them an element at a
// time, returning the count of the differences.
func Distance(strandA, strandB string) int {
	length := shorter(strandA, strandB)
	distance := 0

	for i := 0; i < length; i++ {
		if strandA[i] != strandB[i] {
			distance++
		}
	}

	return distance
}

func shorter(strandA, strandB string) int {
	if len(strandA) < len(strandB) {
		return len(strandA)
	}
	return len(strandB)
}