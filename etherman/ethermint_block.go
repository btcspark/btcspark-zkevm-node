package etherman

import (
	"encoding/json"
	"fmt"
	"github.com/ethereum/go-ethereum/common"
	"github.com/ethereum/go-ethereum/common/hexutil"
	"github.com/ethereum/go-ethereum/rpc"
	"math/big"
	"strings"
)

type BigInt struct {
	big.Int
}

func (i *BigInt) UnmarshalJSON(b []byte) error {
	var val string
	err := json.Unmarshal(b, &val)
	if err != nil {
		return err
	}
	_, success := i.SetString(strings.TrimPrefix(val, "0x"), 16)
	if !success {
		return fmt.Errorf("cannot convert string to big integer")
	}
	return nil
}

type EthermintBlock struct {
	BlockNumber     *BigInt     `json:"number"`
	BlockHash       common.Hash `json:"hash"`
	BlockParentHash common.Hash `json:"parentHash"`
}

func (b *EthermintBlock) ParentHash() common.Hash { return b.BlockParentHash }

func (b *EthermintBlock) Hash() common.Hash { return b.BlockHash }

func (b *EthermintBlock) NumberU64() uint64 { return b.BlockNumber.Uint64() }

func toBlockNumArg(number *big.Int) string {
	if number == nil {
		return "latest"
	}
	if number.Sign() >= 0 {
		return hexutil.EncodeBig(number)
	}
	// It's negative.
	if number.IsInt64() {
		return rpc.BlockNumber(number.Int64()).String()
	}
	// It's negative and large, which is invalid.
	return fmt.Sprintf("<invalid %d>", number)
}
