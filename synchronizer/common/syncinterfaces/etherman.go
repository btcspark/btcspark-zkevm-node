package syncinterfaces

import (
	"context"
	"math/big"

	"github.com/0xPolygonHermez/zkevm-node/etherman"
	"github.com/ethereum/go-ethereum/common"
)

// EthermanFullInterface contains the methods required to interact with ethereum.
type EthermanFullInterface interface {
	HeaderByNumber(ctx context.Context, number *big.Int) (*etherman.EtherHeader, error)
	GetRollupInfoByBlockRange(ctx context.Context, fromBlock uint64, toBlock *uint64) ([]etherman.Block, map[common.Hash][]etherman.Order, error)
	EthBlockByNumber(ctx context.Context, blockNumber uint64) (*etherman.EtherBlock, error)
	GetLatestBatchNumber() (uint64, error)
	GetTrustedSequencerURL() (string, error)
	VerifyGenBlockNumber(ctx context.Context, genBlockNumber uint64) (bool, error)
	GetLatestVerifiedBatchNum() (uint64, error)
}

type EthermanGetLatestBatchNumber interface {
	GetLatestBatchNumber() (uint64, error)
}
