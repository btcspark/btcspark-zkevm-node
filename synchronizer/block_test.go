package synchronizer

import (
	"context"
	"fmt"
	"testing"
)

func TestGetBlockByNumber(t *testing.T) {
	block, _ := GetBlockByNumber(context.Background(), 204)
	fmt.Println(block)
}
